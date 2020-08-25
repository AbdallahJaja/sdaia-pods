//
//  Constants.swift
//  CorporateCoronaApp-iOS
//
//  Created by Aziz Dev on 28/03/2020.
//  Copyright © 2020 Aziz Dev. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let reloadPermitHistory = Notification.Name("KM_reloadPermitHistory")
    static let reloadGatherPermits = Notification.Name ("KM_reloadGatherPermits")
}

public struct KMUserDefault {
    public static let showProfileImgKey = "showProfileImgKey"
    public static let isAdvancedGPS = "isAdvancedGPS"
    public static let appTerminatedWithBracelet = "appTerminatedWithBracelet"
    public static let bluetoothOffWithBracelet = "bluetoothOffWithBracelet"

}

public struct RegExpConst
{
    //RegularExpression
    static let emailRegExp = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    static let alphanumericRegExp = "[a-zA-Z0-9]"
    static let alphanumericArRegExp = "^[\\p{Arabic}\\s\\p{N}]+$"
    static let alphaRegExp = "[a-zA-Z]"
    static let numericRegExp = "[0-9]"
    
    static let alphaAbjdRegExp = "^[A-Za-zء-ي ]+$"
    static let alphanumericAbjdRegExp = "^[A-Za-z0-9ء-ي٠-٩ ]+$"
    
    static let carPlateRegExp = "^[A-Za-zء-ي]+$"

}

public struct CautiousModeConst
{
    static let infected = "7BD23994-59F9-4344-BAC3-CAC7194F6EDD"
    static let suspected = "DBDFE494-D885-4C9B-B9EE-7F49174BB4E6"
    static let btName = "TAWAKKALNA"
}

public extension String {
    //RegularExpression
    func isValidWithReEx(_ reEx : String) -> Bool {
        let xRegEx = reEx
        let strTest = NSPredicate(format:"SELF MATCHES %@", xRegEx)
        return strTest.evaluate(with: self)
    }
}
