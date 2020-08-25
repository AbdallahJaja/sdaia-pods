//
//  APIErrors.swift
//  Alamofire
//
//  Created by AbdallahJaja on 24/08/2020.
//

import Foundation

public enum TwkAPIErrors: LocalizedError {
    case notFoundError(String)
    case validationError(String)
    case otherError(String)

    public var errorDescription: String? {

        switch self {
        case .notFoundError(let error):
            return error
        case .otherError(let error):
            return error
        case .validationError(let error):
            return error
        }
    }
}
