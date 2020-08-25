//
//  AppURL.swift
//  CorporateCoronaApp-iOS
//
//  Created by Aziz Dev on 24/03/2020.
//  Copyright © 2020 Aziz Dev. All rights reserved.
//

import Foundation

struct ServicesEnvironment {
    
    /// `EnvType` will be responsible to define Envs name and configuration.
    enum EnvType {
        case dev
        case qa
        case preProduction
        case production
        case dotNet
        case sample
        case devL1
        case devGL2
    }
    
    static let environment: EnvType = .qa
    static let environmentSec: EnvType = .qa

    /// `Domain` will be responsible to define urls and env.
    struct Domains {
        
        static let dev = "http://snf1.nic.gov.sa"
        static let preProduction = "https://snf2.nic.gov.sa"
        static let production = "https://snf3.nic.gov.sa"
        static let qa = "https://snf4.nic.gov.sa"
        static let dotNet = "http://78.93.161.126"
        static let devL1 = "https://twkdev.nic.gov.sa:8080"
        static let devGL2 = "https://twkdev.nic.gov.sa:8090"
        
        /// This is will be used to get env URL
        static func getEnvURL() -> String {
            switch ServicesEnvironment.environment {
            case .dev:
                return Domains.dev
            case .qa:
                return Domains.qa
            case .preProduction:
                return  Domains.preProduction
            case .production:
                return  Domains.production
            case .sample:
                return  Domains.dev
            case .dotNet:
                return Domains.dotNet
            case .devL1 :
                return Domains.devL1
            case .devGL2 :
                return Domains.devGL2
            }
        }
        
        static func getSecEnvURL() -> String {
            switch ServicesEnvironment.environmentSec {
            case .dev:
                return  Domains.dev
            case .qa:
                return Domains.qa
            case .preProduction:
                return  Domains.preProduction
            case .production:
                return  Domains.production
            case .sample:
                return  Domains.dev
            case .dotNet:
                return Domains.dotNet
            case .devL1 :
                return Domains.devL1
            case .devGL2 :
                return Domains.devGL2
            }
        }
        /// This is will be used to expose logging in console or not
        static var isVerbose: Bool {
            return environment == .dev || environment == .dev
        }
    }
    
    static func getTermsURL() -> String {
        return Domains.getEnvURL() + WebAPI.Path.appTerms.URL
    }
}

