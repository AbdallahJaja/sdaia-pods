//
//  ScrollView+Extension.swift
//  Tawakkalna
//
//  Created by Heba Nageh on 01/01/1442 AH.
//  Copyright © 1442 Ministry of Health. All rights reserved.
//

import UIKit

public extension UIScrollView {
    
    func snapshot() -> UIImage?
       {
            UIGraphicsBeginImageContextWithOptions(self.contentSize, false, UIScreen.main.scale);

           let savedContentOffset = self.contentOffset
           let savedFrame = self.frame

           self.contentOffset = CGPoint.zero
           self.frame = CGRect(x: 0, y: 0, width: self.contentSize.width, height: self.contentSize.height)

           self.layer.render(in: UIGraphicsGetCurrentContext()!)
           let image = UIGraphicsGetImageFromCurrentImageContext()

           self.contentOffset = savedContentOffset
           self.frame = savedFrame

           UIGraphicsEndImageContext()

           return image
       }
}

public extension UIStackView {
    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach {
            self.removeArrangedSubview($0)
            NSLayoutConstraint.deactivate($0.constraints)
            $0.removeFromSuperview()
        }
    }
}
