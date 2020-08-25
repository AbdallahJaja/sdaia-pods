
import Alamofire
import PromiseKit

open class WebAPI {

    public typealias RequestMethodType = HTTPMethod
    public typealias RequestPayloadType = [String: Any]
    public typealias ServerTrustPolicies = [String: ServerTrustEvaluating]

    fileprivate let loggingEnabled: Bool
    fileprivate let type: String

    fileprivate let manager: Session
    fileprivate var headers = [String:String]()

    public struct Path {

        public let URL: String
        public let method: RequestMethodType
        public let title: String

        public init(URL: String, method: RequestMethodType, title: String) {

            self.URL    = URL
            self.method = method
            self.title  = title
        }

        public init(path: Path, urlParam: String, title: String) {

            self.URL    = path.URL + "/" + urlParam
            self.method = path.method
            self.title  = title
        }

        public init(path: Path, queryParams: [String:String], title: String) {

            var readyQueryParams = ""

            for (index, element) in queryParams.enumerated() {

                if index == 0 {

                    readyQueryParams += "?"

                } else {

                    readyQueryParams += "&"
                }

                readyQueryParams += "\(element.0)=\(element.1)"
            }

            self.URL = path.URL + readyQueryParams
            self.method = path.method
            self.title = title
        }

        public func pathWith(urlParam: String) -> Path {

            return Path(path: self, urlParam: urlParam, title: title)
        }

        public func pathWith(queryParam: (String, String)) -> Path {

            let newURL = URL.contains("?") ? URL.appending("&") : URL.appending("?")

            return Path(URL: newURL.appending("\(queryParam.0)=\(queryParam.1)"), method: method, title: title)
        }

        public func pathWith(queryParams: [String:String]) -> Path {

            return Path(path: self, queryParams: queryParams, title: title)
        }
    }

    //********************************************************************************

    public init(manager: Session, type: String, loggingEnabled: Bool) {

        self.manager = manager
        self.type = type
        self.loggingEnabled = loggingEnabled
    }

    //********************************************************************************

    open func setRequestHeader(_ key: String, value: String?) {

        headers[key] = value
    }

    open func unsetAllRequestHeaders() {

        headers.removeAll()
    }

    open func pinnedCertificates(certBase64: String, acceptSelfSignedCertificates: Bool, performDefaultValidation: Bool, validateHost: Bool) -> PinnedCertificatesTrustEvaluator {
        guard let certificateData = Data(base64Encoded: certBase64, options: [])  else {
            return PinnedCertificatesTrustEvaluator()
        }

        guard let certificate = SecCertificateCreateWithData(nil, certificateData as CFData) else {
            return PinnedCertificatesTrustEvaluator()
        }
        //  use certificate to initialize PinnedCertificatesTrustEvaluator, or ...
        return PinnedCertificatesTrustEvaluator(certificates: [certificate], acceptSelfSignedCertificates: acceptSelfSignedCertificates, performDefaultValidation: performDefaultValidation, validateHost: validateHost)
    }


    //********************************************************************************

    public func requestWithMethod(_ method: RequestMethodType, requestURL: String, requestPayload: RequestPayloadType?, encoding: ParameterEncoding = JSONEncoding.default, title: String = "", requestHeaders: [String: String] = [:]) -> Promise<(Data, Int)> {

        return firstly {
            requestWithHTTPResponseWithMethod(method, requestURL: requestURL, requestPayload: requestPayload,
                                              encoding: encoding, title: title, requestHeaders: requestHeaders)
        }.then { (result: (Data, HTTPURLResponse)) -> Promise<(Data, Int)> in
            Promise.value( (result.0, result.1.statusCode) )
        }
    }

    public func requestWithHTTPResponseWithMethod(_ method: RequestMethodType, requestURL: String, requestPayload: RequestPayloadType?, encoding: ParameterEncoding = JSONEncoding.default, title: String, requestHeaders: [String: String]) -> Promise<(Data, HTTPURLResponse)> {

        return Promise { seal in

            var headers = requestHeaders

            for (key, value) in self.headers {
                headers[key] = value
            }

            var httpHeaders: HTTPHeaders = []
            for (key, value) in self.headers {
                httpHeaders.add(HTTPHeader(name: key, value: value))
            }

            guard requestURL.hasPrefix("http") else {
                return seal.reject(NSError(domain: "io.twk.webapi", code: 999, userInfo:[NSLocalizedDescriptionKey:"Invalid url"]))
            }

            DispatchQueue.main.async { UIApplication.shared.isNetworkActivityIndicatorVisible = true }

//            manager.httpShouldHandleCookies = false
            manager.request(requestURL, method: method, parameters: requestPayload, encoding: encoding, headers: httpHeaders)
                .responseData(completionHandler: { (response) -> Void in

                #if DEBUG

                print("")
                print("")
                print("===================Start Request==================")

                print("TITLE: \(title)")
                print("MEYTHOD: \(method.rawValue.uppercased())")
                print("URL: \(requestURL)")
                print("HEADERS: \(headers)")

                if let requestPayload = requestPayload {
                    print("[Payload]: \(requestPayload)")
                } else {
                    print("[Payload]: NULL")
                }

//                let timeline = response.timeline
//
//                print("[Result]:   \(response.result)")
//                print("[Latency] \(timeline.latency.formatted)")
//                print("[Start Time]   \(timeline.requestStartTime.formattedDate)")
//                print("[Request Duration]   \(timeline.requestDuration.formatted)")
//                print("[Serialization Duration]   \(timeline.serializationDuration.formatted)")
//                print("[Total Duration]   \(timeline.totalDuration.formatted)")


                debugPrint(response)

                switch response.result {

                case .success(let data):

                    if let code = response.response?.statusCode {
                        print("Status Code: \(code)")
                    }
                    
                    if let data = try? JSONSerialization.jsonObject(with: data) {
                        print("Data: \(data)")
                    }

                case .failure(let error):

                    let myError = error as NSError
                    print("Error Code: \(myError.code)")
                    print("Error: \(myError.localizedDescription)")
                }
                print("===================End Request===================")
                print("")
                print("")

                #endif

                //***************
                // Logging

                if self.loggingEnabled {

                    var details = [String: Any]()

                    details["verb"] = method.rawValue.uppercased()
                    details["url"] = requestURL
                    if let url = URL(string: requestURL) {
                        details["path"] = url.path
                    }
                    details["request"] = requestPayload

                    switch response.result {

                    case .success(let data):

                        details["status"] = "\(response.response?.statusCode ?? 999)"
                        details["response"] = try? JSONSerialization.jsonObject(with: data)

                    case .failure(let error):

                        let nsError = error as NSError

                        details["status"] = "999"
                        details["response"] = [
                            "nserror_code": nsError.code,
                            "nserror_description": nsError.localizedDescription
                        ]
                    }
                }

                // End logging
                //***************

                switch response.result {

                case .success(let data):
                    seal.fulfill((data, response.response!))

                case .failure(let error):
                    seal.reject(error)
                }

                DispatchQueue.main.async { UIApplication.shared.isNetworkActivityIndicatorVisible = false }
            })
        }
    }
}

class CustomSessionDelegate: SessionDelegate {
    var crtBase64 = ""

    override init(fileManager: FileManager = .default) {
        super.init(fileManager: fileManager)
    }

    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        guard let trust = challenge.protectionSpace.serverTrust, SecTrustGetCertificateCount(trust) > 0 else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }

        if let serverCertificate = SecTrustGetCertificateAtIndex(trust, 0) {
            let serverCertificateData = SecCertificateCopyData(serverCertificate) as Data
            guard let serverCertData = NSData(base64Encoded: serverCertificateData.base64EncodedString(), options: NSData.Base64DecodingOptions(rawValue: 0)) else {
                completionHandler(.cancelAuthenticationChallenge, nil)
                return
            }
            guard let certData = NSData(base64Encoded: crtBase64, options:  NSData.Base64DecodingOptions(rawValue: 0)) else {
                completionHandler(.cancelAuthenticationChallenge, nil)
                return
            }
            if certData == serverCertData {
                // unlock trust certificate
                //Connectivity.shared.didUnlockChallenge = true
                completionHandler(.useCredential, URLCredential(trust: trust))
                return
            }
        }

        completionHandler(.cancelAuthenticationChallenge, nil)
    }
}
