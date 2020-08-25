//
//  APIErrors.swift
//  Alamofire
//
//  Created by AbdallahJaja on 24/08/2020.
//

import Foundation

public struct APIsKeys {
    static let GMS_APIKey = "AIzaSyDC5-mElE-9YedfVNT4e5sClIg77b26i2g"

    static var clientSecret : String {
        switch ServicesEnvironment.environment {
            case .dev:
            return "5426a4b3-db86-4b0a-9508-122040441230"
            default:
            return ""
        }
    }

    static var clientId : String {
        switch ServicesEnvironment.environment {
            case .dev:
                return "km-public"
            default:
                return ""
        }
    }

}

