//
//  RequestSender.swift
//  TwkWebAPI
//
//  Created by AbdallahJaja on 24/08/2020.
//

import Alamofire
import PromiseKit
import Foundation
import FakeLocationDetector

internal extension WebAPI.Path {

    //MARK:- other API Paths
    static let appTerms = WebAPI.Path(URL: "/api/core", method: .post, title: "")
    static let updateLocation = WebAPI.Path(URL: "/location", method: .post, title: "")
    //Using this request for to make SSL delegate is not hijacked
    static let challengeUnlock = WebAPI.Path(URL: "/", method: .post, title: "")

    //MARK:- User API Paths
    static let userInfo = WebAPI.Path(URL: "/api/core/user/protected/user-info", method: .post, title: "user-info")
    static let login = WebAPI.Path(URL: "/api/core/user/public/login", method: .post, title: "login")
    static let refreshToken = WebAPI.Path(URL: "/api/core/user/public/oauth/token", method: .post, title: "token")
    static let verifyLoginOTP = WebAPI.Path(URL: "/api/core/user/public/verify-login-otp", method: .post, title: "verify-login-otp")
    static let verifyOTP = WebAPI.Path(URL: "/api/core/user/public/verify-otp", method: .post, title: "verify-otp")
    static let createUserPassowrd = WebAPI.Path(URL: "/api/core/user/public", method: .post, title: "public")
    static let changePassword = WebAPI.Path(URL: "/api/core/user/protected/changepassword", method: .post, title: "changePassword")
    static let sendMobileNumber = WebAPI.Path(URL: "api/core/user/public/send-otp", method: .post, title: "sendMobileNumber")
    static let checkAppVersion = WebAPI.Path(URL: "api/core/user/version", method: .post, title: "checkAppVersion")
    static let uploadDeviceToken = WebAPI.Path(URL: "api/core/user/protected/device", method: .post, title: "uploadDeviceToken")
    static let updateHomeLocation = WebAPI.Path(URL: "/api/core/user/protected/", method: .post, title: "updateHomeLocation")
    static let getUserImage = WebAPI.Path(URL: "/api/core/user/protected/img", method: .post, title: "getUserImage")
    static let addHealth = WebAPI.Path(URL: "/api/core/user/protected/health", method: .post, title: "addHealth")

    //MARK:- Dependents API Paths
    static let getDependentAll = WebAPI.Path(URL: "/api/dependent/all/", method: .post, title: "getDependentAll")
    static let createDependent = WebAPI.Path(URL: "/api/dependent", method: .post, title: "createDependent")
    static let getDependentsAndSponsrees = WebAPI.Path(URL: "/api/core/dependent/all", method: .post, title: "getDependentsAndSponsrees")
    static let sendSelectedDependts = WebAPI.Path(URL: "/api/core/dependent", method: .post, title: "sendSelectedDependts")

    //MARK:- Report API Paths
    static let reportIcidentQr = WebAPI.Path(URL: "/api/core/report/qrreport", method: .post, title: "reportIcidentQr")
    static let addReport = WebAPI.Path(URL: "/api/core/report", method: .post, title: "addReport")

    //MARK:- Feeds API Paths
    static let getFeeds = WebAPI.Path(URL: "/api/feed/moh", method: .post, title: "getFeeds")
    static let getAnnouncement = WebAPI.Path(URL: "/api/feed/announcement", method: .post, title: "getAnnouncement")

    //MARK:- Quota API Paths
    static let requestQuota = WebAPI.Path(URL: "/api/quota/", method: .post, title: "requestQuota")
    static let cancelQuota = WebAPI.Path(URL: "/api/quota/cancel", method: .post, title: "cancelQuota")

    //MARK:- Registration API Paths
    static let checkRegistration = WebAPI.Path(URL: "api/core/user/public/check-registration", method: .post, title: "checkRegistration")
    static let getNationalities = WebAPI.Path(URL: "/api/core/user/public/getnationalities", method: .post, title: "getNationalities")
    static let getGccNationalities = WebAPI.Path(URL: "/api/core/user/public/getgccnationalities", method: .post, title: "getGccNationalities")
    static let visitorRegistration = WebAPI.Path(URL: "/api/core/user/public/check-registration", method: .post, title: "visitorRegistration")

    //MARK:- Permits API Paths
    static let permitHistory = WebAPI.Path(URL: "api/quota/v2/history", method: .post, title: "permitHistory")
    static let sendEmergencyPermit = WebAPI.Path(URL: "/api/v2/permits/createmedicalemergencypermit", method: .post, title: "sendEmergencyPermit")
    static let cancelEmergencyPermit = WebAPI.Path(URL: "/api/v2/permits/cancelmedicalemergencypermit", method: .post, title: "cancelEmergencyPermit")
    static let sendEmergencyDriverPermit = WebAPI.Path(URL: "/api/v2/permits/createdriverpermit", method: .post, title: "sendEmergencyDriverPermit")
    static let checkInHospital = WebAPI.Path(URL: "/api/v2/permits/checkinhospitalpermit", method: .post, title: "checkInHospital")
    static let checkOutHospital = WebAPI.Path(URL: "/api/v2/permits/checkouthospitalpermit", method: .post, title: "checkOutHospital")
    static let getHospitalPermit = WebAPI.Path(URL: "/api/v2/permits/permitforhospital", method: .post, title: "getHospitalPermit")
    static let appendQuota = WebAPI.Path(URL: "/api/v2/permits/driver", method: .post, title: "appendQuota")
    static let createHumanitarianRequest = WebAPI.Path(URL: "/api/humanitarianpermit/request", method: .post, title: "createHumanitarianRequest")

    //MARK:- Creates new Bracelet for a user API Path
    static let newBracelet = WebAPI.Path(URL: "/api/core/user/bracelet/bracelet", method: .post, title: "newBracelet")
    //MARK:- Inserts new Bracelet Action done by user API Path
    static let insertBracelet = WebAPI.Path(URL: "/api/core/user/bracelet/braceletaction", method: .post, title: "insertBracelet")

    //MARK:- Health Care  API Paths
    static let addHCAttahcments = WebAPI.Path(URL: "/api/humanitarianpermit/addattahcments", method: .post, title: "addHCAttahcments")
    static let uploadHCAttachment = WebAPI.Path(URL: "/api/attachment/upload", method: .post, title: "uploadHCAttachment")
    static let getHCPermitCompanions = WebAPI.Path(URL: "/api/humanitarianpermit/companions", method: .post, title: "getHCPermitCompanions")

    //MARK:- Gathering Permission API Paths
    static let getGatheringPermission = WebAPI.Path(URL: "/api/gatheringpermission/permit", method: .post, title: "getGatheringPermission")
    static let creatGatheringPermission = WebAPI.Path(URL: "/api/gatheringpermission/createpermit", method: .post, title: "creatGatheringPermission")
    static let editGatheringPermission = WebAPI.Path(URL: "/api/gatheringpermission/editpermit", method: .post, title: "editGatheringPermission")
    static let cancelGatheringPermission = WebAPI.Path(URL: "/api/gatheringpermission/cancelpermit", method: .post, title: "cancelGatheringPermission")
    static let addAdmin = WebAPI.Path(URL: "/api/gatheringpermission/addadmin", method: .post, title: "addAdmin")
    static let removeAdmin = WebAPI.Path(URL: "/api/gatheringpermission/removeadmin", method: .post, title: "removeAdmin")
    static let checkIn = WebAPI.Path(URL: "/api/gatheringpermission/checkin", method: .post, title: "checkIn")
    static let checkOut = WebAPI.Path(URL: "/api/gatheringpermission/checkout", method: .post, title: "checkOut")
    static let validateAdmin = WebAPI.Path(URL: "/api/gatheringpermission/validateadmin", method: .post, title: "validateAdmin")
    static let allGatheringPermissions  = WebAPI.Path(URL: "/api/gatheringpermission/all", method: .post, title: "allGatheringPermissions")
    static let validateCheckIn = WebAPI.Path(URL: "/api/gatheringpermission/validatecheckin", method: .post, title: "validateCheckIn")
    static let isTwakalnaUser = WebAPI.Path(URL: "/api/core/user/protected/istwkregistereduser", method: .post, title: "isTwakalnaUser")
    static let checkOutAll = WebAPI.Path(URL: "/api/gatheringpermission/checkoutall", method: .post, title: "checkOutAll")
    static let checkInInfo = WebAPI.Path(URL: "/api/gatheringpermission/checkeininfo", method: .post, title: "checkInInfo")

    //MARK:- Followers API Paths

    static let getFollowers = WebAPI.Path(URL: "/api/core/dependent/children", method: .post, title: "getFollowers")
    static let followerLocation = WebAPI.Path(URL: "/api/core/dependent/childlocation", method: .post, title: "followerLocation")
    static let followingRequests = WebAPI.Path(URL: "/api/core/dependent/anyfollowingrequest", method: .post, title: "followingRequests")
    static let acceptFollowing = WebAPI.Path(URL: "/api/core/dependent/acceptfollowing", method: .post, title: "acceptFollowing")
    static let changeFollowStatus = WebAPI.Path(URL: "/api/core/dependent/followchild", method: .post, title: "changeFollowStatus")
    static let twkFollowerCard = WebAPI.Path(URL: "/api/core/dependent/dependentcard", method: .post, title: "twkFollowerCard")

    //MARK:- Notifications API Paths
    static let publicNotification = WebAPI.Path(URL: "/api/feed/publiceannouncements", method: .post, title: "publicNotification")
    static let personalNotification = WebAPI.Path(URL: "/api/feed/privateannouncements", method: .post, title: "personalNotification")
    static let readNotification = WebAPI.Path(URL: "/api/feed/updateannouncement", method: .post, title: "readNotification")

    //MARK:- Change Non AbsherUser Mobile Number API Paths
    static let changeNonAbsherUserMobileNumber = WebAPI.Path(URL: "/api/core/user/protected/changemobilenumberfornonabsher", method: .post, title: "changeNonAbsherUserMobileNumber")
    static let verifyChangeNonAbsherUserMobileNumberOTP = WebAPI.Path(URL: "/api/core/user/protected/updatemobilenumberfornonabsher", method: .post, title: "verifyChangeNonAbsherUserMobileNumberOTP")

      //MARK:- Manual Check In
    static let manualCheckIn = WebAPI.Path(URL: "/api/gatheringpermission/reversecheckin", method: .post, title: "manualCheckIn")
    static let validateGatheringVistor = WebAPI.Path(URL: "/api/gatheringpermission/validatebyidanddob", method: .post, title: "validateGatheringVistor")

    //MARK:- Taakd Clinicls
    static let checkUpResults = WebAPI.Path(URL: "/api/takkad/testresult", method: .post, title: "checkUpResults")
    static let checkEligibility = WebAPI.Path(URL: "/api/takkad/checkeligibility", method: .post, title: "checkEligibility")
    static let cancelAppoinment = WebAPI.Path(URL: "/api/takkad/cancelappointment", method: .post, title: "cancelAppoinment")
    static let healthSurvey = WebAPI.Path(URL: "/api/takkad/questions", method: .post, title: "healthSurvey")
    static let checkCenters = WebAPI.Path(URL: "/api/takkad/clinics", method: .post, title: "checkCenters")
    static let appointemntDays = WebAPI.Path(URL: "/api/takkad/days", method: .post, title: "appointemntDays")
    static let appointemntTimeSlots = WebAPI.Path(URL: "/api/takkad/timeslots", method: .post, title: "appointemntTimeSlots")
    static let submitAppointment = WebAPI.Path(URL: "/api/takkad/reserveappointment", method: .post, title: "submitAppointment")

    //MARK:- MOE Followers API Paths

    static let getMOEFollowers = WebAPI.Path(URL: "/api/carefullylearn/getmoeusers", method: .post, title: "getMOEFollowers")
    static let sendMOEFollowes = WebAPI.Path(URL: "/api/carefullylearn/sendsmstomoeuserslist", method: .post, title: "sendMOEFollowes")
}

public class RequestSender {

    #if DEBUG
        static let baseURL = "https://api.foodics.dev/v5"
        static let authURL = "https://api.foodics.dev/oauth/token/device"
    #elseif Release
        static let baseURL = "https://api-sandbox.foodics.com/v5"
        static let authURL = "https://api-sandbox.foodics.com/oauth/token/device"
    #elseif Obf_Release
        static let baseURL = "https://api.foodics.com/v5"
        static let authURL = "https://api.foodics.com/oauth/token/device"
    #endif

    public static var clientId = ""
    public static var clientSecret = ""

    fileprivate static let webAPI: WebAPI = {

        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest  = 60
        configuration.timeoutIntervalForResource = 60

        let manager = Session(
            configuration: configuration,
            serverTrustManager: ServerTrustManager(evaluators: RequestSender.policies())
        )

        let webAPI = WebAPI(manager: manager, type: "twk", loggingEnabled: false)
        webAPI.setRequestHeader("Accept", value: "application/json")

        return webAPI
    }()

    public static var deactivateAction: (() -> ())?

//********************************************************************************

    fileprivate static func policies() -> WebAPI.ServerTrustPolicies {

        return [
            "snf4.nic.gov.sa": .disableEvaluation,
            "snf3.nic.gov.sa": .pinPublicKeys (
                publicKeys: ServerTrustEvaluating.publicKeys(in: Bundle(for: RequestSender.self)),
                validateCertificateChain: true,
                validateHost: true
            )
        ]
    }

    static func defaultAppServiceSession() -> Alamofire.Session {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default

        //#warning("please change the Hostname + cert")
        let crtBase64 = "MIIGtTCCBZ2gAwIBAgIRAJOmc9I8THD3AAAAAFD+7ZEwDQYJKoZIhvcNAQELBQAwgboxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1FbnRydXN0LCBJbmMuMSgwJgYDVQQLEx9TZWUgd3d3LmVudHJ1c3QubmV0L2xlZ2FsLXRlcm1zMTkwNwYDVQQLEzAoYykgMjAxMiBFbnRydXN0LCBJbmMuIC0gZm9yIGF1dGhvcml6ZWQgdXNlIG9ubHkxLjAsBgNVBAMTJUVudHJ1c3QgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkgLSBMMUswHhcNMjAwMjE1MTAzMjMyWhcNMjEwMjE4MTEwMjMwWjBbMQswCQYDVQQGEwJTQTEPMA0GA1UEBxMGUml5YWRoMSQwIgYDVQQKExtOYXRpb25hbCBJbmZvcm1hdGlvbiBDZW50ZXIxFTATBgNVBAMMDCoubmljLmdvdi5zYTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKPGt8HI7Ttuen2hS6UTb6sgtntX8jBCvt8lP+8ozHdJxw9oRhTC2kftmJ0Z/dxtbPcuXCLhBmzq2CvuMFzzWl3//m+e/vsLX6XdiQ3uocqznU444BuL4yh9bN931LTQZ+ZQFND6PH8vJgvUCjfIb+9yq9ZT0+qEaNWAzWdpf1eqdeGON8Mk7JJYPAyPXrT5P56OMeOlG12kcLbK1Xt4MVjiay+30u4y+0E/T/Sdk2JRhbwFlHnW5T9CT2uH8Efux8MzDGAP7y1/JKZii67g8qynuiCAzdI6GhdoBjyfjz35l9Z3il7Q37mn5DgnB0U54vxpDhJUy6pm02f7F1U75r0CAwEAAaOCAxIwggMOMCMGA1UdEQQcMBqCDCoubmljLmdvdi5zYYIKbmljLmdvdi5zYTCCAX8GCisGAQQB1nkCBAIEggFvBIIBawFpAHYAVYHUwhaQNgFK6gubVzxT8MDkOHhwJQgXL6OqHQcT0wwAAAFwSIOrSwAABAMARzBFAiB0gaw970jPxqDI9j1ZuAi+hmiHTyWqFnQVSxcAhm/1RAIhAJRSNFGvsVuL98Sdh3PHQ5HYUcDpSazzAue2MIfHq1r3AHcAh3W/51l8+IxDmV+9827/Vo1HVjb/SrVgwbTq/16ggw8AAAFwSIOrjwAABAMASDBGAiEA7NMs6t1a6mJdZcdW5xwIsi3wGFuzRSr5fvxeeubd+I8CIQCwFpO+z9ftfIpNlrwvNrFoSaoOk5GmjEDdg+8lQO/FdAB2APZclC/RdzAiFFQYCDCUVo7jTRMZM7/fDC8gC8xO8WTjAAABcEiDq0gAAAQDAEcwRQIgAoXkBRZVmjvLhabqH0WzkLizpFBU7dShxLAFayODaGcCIQCzniLerrGy7ttgHRpoWQf6txpMSYuXSdGEmTBow3m1lTAOBgNVHQ8BAf8EBAMCBaAwHQYDVR0lBBYwFAYIKwYBBQUHAwEGCCsGAQUFBwMCMDMGA1UdHwQsMCowKKAmoCSGImh0dHA6Ly9jcmwuZW50cnVzdC5uZXQvbGV2ZWwxay5jcmwwSwYDVR0gBEQwQjA2BgpghkgBhvpsCgEFMCgwJgYIKwYBBQUHAgEWGmh0dHA6Ly93d3cuZW50cnVzdC5uZXQvcnBhMAgGBmeBDAECAjBoBggrBgEFBQcBAQRcMFowIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLmVudHJ1c3QubmV0MDMGCCsGAQUFBzAChidodHRwOi8vYWlhLmVudHJ1c3QubmV0L2wxay1jaGFpbjI1Ni5jZXIwHwYDVR0jBBgwFoAUgqJwdN28Uz/Pe9T3zX+nYMYKTL8wHQYDVR0OBBYEFMJUldLKwRGTdXOGUoC7EaoaYLWrMAkGA1UdEwQCMAAwDQYJKoZIhvcNAQELBQADggEBAH/M24Hxx0Vsm/tONyy1/WFugU0OwHFCf64jUtizeWe1zTbmIGsJCLIGd3p5DnHnq2vA2JJaii+hJuklaRvL7VHz4hLAPgoFKs79rC62VKDvwWWlj3Y1fPVZHsroRWTvLxjhHKPaC4ulnaa251CzGDqrI9S6XJHVbt2vBkc1JwI4CxUjZ3dYcmBg01BxFybZHawh/SYf12cPe3Dr+ZDJPSrzvPappBpwlG8nMD56V7phRmFBqTtdDqiJMJUPpW+tJfOQLVc6LmoVJhuYTJVhYBjXIGEh0e5Xo4XT2w5eDjqsqqrXJAYL0r6gvB7rzqrvYa8lRbf6bxTRXVVyS7dMWsw=".trimmingCharacters(in: .whitespacesAndNewlines)
        let host = "snf3.nic.gov.sa"

//        let pinnedCert = MoyaProvider<MultiTarget>.pinnedCertificates(certBase64: crtBase64, acceptSelfSignedCertificates: true, performDefaultValidation: true, validateHost: true)
//        let manager = ServerTrustManager(evaluators: [host: pinnedCert])
        let sessionDelegate = CustomSessionDelegate()
//        sessionDelegate.crtBase64 = crtBase64

        return Alamofire.Session(configuration: .default, delegate: sessionDelegate, rootQueue: .main, startRequestsImmediately: true, requestQueue: nil, serializationQueue: nil, interceptor: nil, serverTrustManager: manager, redirectHandler: nil, cachedResponseHandler: nil, eventMonitors: [])
    }

//********************************************************************************

    public static func setToken(value: String) {

        webAPI.setRequestHeader("Authorization", value: "Bearer \(value)")
    }

    public static func unsetToken() {

        webAPI.setRequestHeader("Authorization", value: nil)
    }

    internal static func defaultHeaders(for endPoint: String) -> [String: String]? {

        let langCode = Locale.current.serviceIdentifier

        var headers = [
            HTTPHeader.defaultUserAgent.name : HTTPHeader.defaultUserAgent.value,
            HTTPHeader.defaultAcceptEncoding.name: HTTPHeader.defaultAcceptEncoding.value,
            HTTPHeader.defaultAcceptLanguage.name: HTTPHeader.defaultAcceptLanguage.value,
            "user-unique-id": UIDevice.current.identifierForVendor?.uuidString ?? "",
            "user-device-language": langCode,
        ]

        // append `FAKE_LOCATION_STATUS` in header request
        if let status = FakeLocationDetector.shared.fakeLocationStatus {
            //only apply for release mode

            headers = headers.adding(newHTTPHeaderFields: [
                "advancedGPS": "\(status.rawValue)",
            ])
            /** END check **/
        }

        // append `score`, `repak` in header request
        headers = headers.adding(newHTTPHeaderFields: [
            "ibaklvl": "\(AppEnvironment.shared.ensureAppController.score)",
        ])

        headers = headers.adding(newHTTPHeaderFields: [
            "bak": AppEnvironment.shared.ensureAppController.repak ? "1" : "0",
        ])

        headers = headers.adding(newHTTPHeaderFields: [
            "accept-language": Locale.current.serviceIdentifier
        ])


        if endPoint == "AuthTarget" || endPoint == "TimeTarget" {
            return headers
        } else {
            let cred = AppEnvironment.shared.authController
            if let oAuth = cred.authToken() {

                // To Retry the Refresh token you can generate random number `let number = Int.random(in: 0 ... 10)`
                // and check if that number is odd or even and manipulate the token to test refresh token.
                // I wish if we could have a better way to test this but this the only way I find to check refresh token.
                headers = headers.adding(newHTTPHeaderFields: [
                    "Authorization": "\(oAuth.tokenType) \(oAuth.accessToken)",
                ])
            }
        }

        return headers
    }

//********************************************************************************

    internal static func send(_ path: WebAPI.Path, payload: WebAPI.RequestPayloadType? = nil,
                              encoding: ParameterEncoding = JSONEncoding.default, baseURL: String = RequestSender.baseURL) -> Promise<Data> {

        let requestHeaders = defaultHeaders(for: path.URL)

        var path = path

        let pathURL = path.URL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!

        return firstly {
            webAPI.requestWithMethod(path.method, requestURL: baseURL + pathURL,
                                                  requestPayload: payload, encoding: encoding, title: path.title, requestHeaders: requestHeaders)
        }.then { (result: (Data, Int)) -> Promise<Data> in
            let statusCode = result.1

            switch statusCode {

                case 200:

                    return Promise.value(result.0)

                case 401:

                    let json = try JSONSerialization.jsonObject(with: result.0) as! [String: Any]

                    let error = (json["message"] as! String)

                    if error == "Unauthenticated." {
                        deactivateAction?()
                    }

                    throw TwkAPIErrors.otherError(error)

                case 404:

                    throw TwkAPIErrors.notFoundError(errorString(from: result))

                case 422:

                    throw TwkAPIErrors.validationError(errorString(from: result))

                default:

                    throw TwkAPIErrors.otherError("Please Try Again Later. Error# \(statusCode)")

            }
        }
    }

    fileprivate static func errorString(from result: (Data, Int)) -> String {

        if let json = try? JSONSerialization.jsonObject(with: result.0) as? [String: Any] {

            if let errors = json["errors"] as? [String: [String]] {
                return errors.flatMap { $0.1 }.joined(separator: "\n")
            } else if let message = json["message"] as? String {
                return message
            } else {
                return "Please Try Again Later. Error# \(result.1)"
            }
        } else {
            return "Please Try Again Later. Error# \(result.1)"
        }
    }
}

extension Locale {
    var serviceIdentifier: String {
        if self.languageCode?.hasPrefix("id") ?? false {
            return "in"
        }
        return self.languageCode ?? "en"
    }
}
