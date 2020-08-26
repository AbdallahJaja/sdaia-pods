//
//  UIFont+Style.swift
//  CoronaApp
//
//  Created by عمر سعيد الشمري on 24/03/2020.
//  Copyright © 2020 Ministry of Health. All rights reserved.
//

import UIKit

//MARK:- KM fonts

public extension UIFont {
    static var km_title1: UIFont {
        return UIFont.systemFont(ofSize: 28, weight: .regular)
    }
    
    static var km_title2: UIFont {
        return UIFont.systemFont(ofSize: 22, weight: .regular)
    }
    
    static var km_title3: UIFont {
        return UIFont.systemFont(ofSize: 20, weight: .regular)
    }
    
    static var km_headline: UIFont {
        return UIFont.systemFont(ofSize: 17, weight: .semibold)
    }
    
    static var km_body: UIFont {
        return UIFont.systemFont(ofSize: 17, weight: .regular)
    }
    
    static var km_callout: UIFont {
        return UIFont.systemFont(ofSize: 16, weight: .regular)
    }

    static var km_subheadline: UIFont {
        return UIFont.systemFont(ofSize: 15, weight: .regular)
    }
    static var km_subhead: UIFont {
           return UIFont.systemFont(ofSize: 14, weight: .regular)
       }
    static var km_footnote: UIFont {
        return UIFont.systemFont(ofSize: 13, weight: .regular)
    }
    
    static var km_caption1: UIFont {
        return UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    
    static var km_caption2: UIFont {
        return UIFont.systemFont(ofSize: 11, weight: .regular)
    }

}

public extension UIFont {
    func withTraits(traits:UIFontDescriptor.SymbolicTraits) -> UIFont {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0) //size 0 means keep the size as it is
    }

    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }

    func italic() -> UIFont {
        return withTraits(traits: .traitItalic)
    }
}
