//
//  UItextField+Extension.swift
//  Tawakkalna
//
//  Created by Assem Imam on 17/07/2020.
//  Copyright © 2020 Ministry of Health. All rights reserved.
//

import UIKit
import Themes

public extension UITextField{
    func addErrorViewToTextfield() {
        let imageview = UIImageView(frame:CGRect(x: 5, y: 5, width: 20, height: 20))
        imageview.image =  UIImage(named: "alert-2")
        imageview.tintColor = #colorLiteral(red: 0.7575006485, green: 0.126909852, blue: 0.1257042289, alpha: 1)
        
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 0, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(imageview)
        self.rightView = iconContainerView
        self.rightViewMode = .always
        self.rightView?.alpha = 0.0
    }
    
    func showErrorStyleForTextField() {
        self.rightView?.alpha = 1.0
        self.layer.borderColor = #colorLiteral(red: 0.7575006485, green: 0.126909852, blue: 0.1257042289, alpha: 1)
        self.layer.borderWidth = 1.5
    }
    
    func hideErrorStyleForTextField() {
        
        self.rightView?.alpha = 0.0
        self.layer.borderColor = Theme.secondaryForegroundColor.cgColor
        self.layer.borderWidth = 0.5
        
    }
}

