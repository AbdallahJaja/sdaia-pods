//
//  String+Data.swift
//  CoronaApp
//
//  Created by عمر سعيد الشمري on 29/03/2020.
//  Copyright © 2020 Ministry of Health. All rights reserved.
//

import Foundation
import UIKit
import CommonCrypto

extension String {
    //
    // Convert a base64 representation to a UIImage
    //
    func convertBase64ToImage() -> UIImage? {
        var base64String = self
        if base64String.hasPrefix("data:"){
            base64String = self.replacingOccurrences(of: "data:image/png;base64,", with: "")
        }
        if let imageData = Data(base64Encoded: self, options: Data.Base64DecodingOptions.ignoreUnknownCharacters),
            let image = UIImage(data: imageData){
            return image
        }
        return nil
    }
}

extension String {
    
    func sha512Hex() -> String {
        if self.isEmpty {
            return self
        }
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA512_DIGEST_LENGTH))
        if let data = self.data(using: String.Encoding.utf8) {
            let value =  data as NSData
            CC_SHA512(value.bytes, CC_LONG(data.count), &digest)

        }
        var digestHex = ""
        for index in 0..<Int(CC_SHA512_DIGEST_LENGTH) {
            digestHex += String(format: "%02x", digest[index])
        }

        return digestHex
    }
    
}

extension String {
    fileprivate var containsOnlyEnglishNumbers: Bool {
        return !isEmpty && range(of: "[^0-9]", options: .regularExpression) == nil
    }
    
    fileprivate var containsOnlyArabicNumbers: Bool {
        return !isEmpty && range(of: "[^٠-٩]", options: .regularExpression) == nil
    }
    
    
    var isNumeric: Bool {
        CharacterSet.decimalDigits.subtracting(CharacterSet(charactersIn: ".")).isSuperset(of: CharacterSet(charactersIn: self))
    }
    
    
    var english: String {
        if (containsOnlyEnglishNumbers) {
            return self
        }
        //return self.applyingTransform(StringTransform.toLatin, reverse: false) ?? self
        
        
        var tempStr = self
        tempStr = tempStr.replacingOccurrences(of: "٠", with: "0")
        tempStr = tempStr.replacingOccurrences(of: "١", with: "1")
        tempStr = tempStr.replacingOccurrences(of: "٢", with: "2")
        tempStr = tempStr.replacingOccurrences(of: "٣", with: "3")
        tempStr = tempStr.replacingOccurrences(of: "٤", with: "4")
        tempStr = tempStr.replacingOccurrences(of: "٥", with: "5")
        tempStr = tempStr.replacingOccurrences(of: "٦", with: "6")
        tempStr = tempStr.replacingOccurrences(of: "٧", with: "7")
        tempStr = tempStr.replacingOccurrences(of: "٨", with: "8")
        tempStr = tempStr.replacingOccurrences(of: "٩", with: "9")
        
        return tempStr
         
    }
    
    var arabic: String {
        if (containsOnlyArabicNumbers) {
            return self
        }
        //return self.applyingTransform(StringTransform.latinToArabic, reverse: false) ?? self
        
        var tempStr = self
        tempStr = tempStr.replacingOccurrences(of: "0", with: "٠")
        tempStr = tempStr.replacingOccurrences(of: "1", with: "١")
        tempStr = tempStr.replacingOccurrences(of: "2", with: "٢")
        tempStr = tempStr.replacingOccurrences(of: "3", with: "٣")
        tempStr = tempStr.replacingOccurrences(of: "4", with: "٤")
        tempStr = tempStr.replacingOccurrences(of: "5", with: "٥")
        tempStr = tempStr.replacingOccurrences(of: "6", with: "٦")
        tempStr = tempStr.replacingOccurrences(of: "7", with: "٧")
        tempStr = tempStr.replacingOccurrences(of: "8", with: "٨")
        tempStr = tempStr.replacingOccurrences(of: "9", with: "٩")
        
        return tempStr
    }
    
    var toCurrentLanguage: String {
        let isArabic = AppUtils.isAppArabic()
        return isArabic ? self.arabic : self.english
    }
    
    var trimmingChars: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        if from >= self.count {
            return self
        }
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }
    
    func substring(to: Int) -> String {
        if to >= self.count {
            return self
        }
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }
    
    func isIqamaNumber() -> Bool {
        return self.hasPrefix("2") || self.hasPrefix("٢")
    }
    func isBorderNumber() -> Bool {
        return self.hasPrefix("3") || self.hasPrefix("٣") || self.hasPrefix("4") || self.hasPrefix("٤")
    }
}


extension String {
    func isValidKMPassword() -> Bool {
        //let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d@$!%*?&]{9,30}$"
        //let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d[\\\\]!@#$&{};:=<>-_+^#\\\\%*?]{9,30}$"
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d[\\\\]{};:=<>_+^#$@!%*?&-]{8,30}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
    
    
    
    func isValidSaudiNumber() -> Bool {
        let passwordRegex = "^(05|٠٥)([0-9٠-٩]{8})$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
        
    }
}

extension String {
    func maskedNumberLocalized() -> String {
        if UIApplication.shared.userInterfaceLayoutDirection == .leftToRight {
            return self
        } else {
            let stars = self.substring(to: 6)
            let number = self.substring(from: 6)
            return number + stars
//            return String(self.reversed())
        }
    }
    func generateStarsMask() -> String {
        var starsString = ""
        for _ in 0..<self.count {
           starsString += "*"
        }
        return starsString
    }
    func maskedNumber() -> String {
            if UIApplication.shared.userInterfaceLayoutDirection == .leftToRight {
                return self
            } else {
                let stars = self.substring(to: 6)
                let masks = self.replacingOccurrences(of: stars, with: stars.generateStarsMask())
                return  masks
            }
        }
}

enum PasswordStrength: Int {
    case none
    case weak
    case moderate
    case strong
    
    static func checkStrength(password: String) -> PasswordStrength {
        let len: Int = password.count
        var strength: Int = 0
        
        switch len {
            case 0:
                return .none
            case 1...11:
                return .weak
            case 12...16:
                strength += 2
            default:
                strength += 3
        }
        
        // Upper case, Lower case, Number & Symbols
        let patterns = ["^(?=.*[A-Z]).*$", "^(?=.*[a-z]).*$", "^(?=.*[0-9]).*$", "^(?=.*[!@#%&-_=:;\"'<>,`~\\*\\?\\+\\[\\]\\(\\)\\{\\}\\^\\$\\|\\\\\\.\\/]).*$"]
        
        for pattern in patterns {
            if (password.range(of: pattern, options: .regularExpression) != nil) {
                strength += 1
            }
        }
        
        switch strength {
            case 0:
                return .none
            case 1...3:
                return .weak
            case 4...6:
                return .moderate
            default:
                return .strong
        }
    }
}
