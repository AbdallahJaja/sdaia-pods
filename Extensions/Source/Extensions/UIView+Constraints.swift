//
//  UIViewExtession.swift
//  Tawakkalna
//
//  Created by Aziz Dev on 24/03/2020.
//  Copyright © 2020 Aziz Dev. All rights reserved.
//

import UIKit

//MARK:- Constraint
public enum ConstraintsAnchors {
    case top(_ constant: CGFloat)
    case bottom(_ constant: CGFloat)
    case leading(_ constant: CGFloat)
    case trailing(_ constant: CGFloat)
    case sidesVertical(_ constant: CGFloat)
    case sidesHorizontal(_ constant: CGFloat)
    case all(_ constant: CGFloat)
    
    case height(_ constant: CGFloat)
    case width(_ constant: CGFloat)

    case centerVertical(_ constant: CGFloat)
    case centerHorizontal(_ constant: CGFloat)
    case center
}

public extension UIView {
    
    func setConstrint(_ anchors: [ConstraintsAnchors]){
        guard let superView = self.superview else{
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false

        for item in anchors {
            switch item {
            case .top(let constant):
                self.topAnchor.constraint(equalTo: superView.topAnchor, constant: constant).isActive = true
            case .bottom(let constant):
                superView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: constant).isActive = true
            case .leading(let constant):
                self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: constant).isActive = true
            case .trailing(let constant):
                superView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: constant).isActive = true
            case .sidesVertical(let constant):
                self.topAnchor.constraint(equalTo: superView.topAnchor, constant: constant).isActive = true
                superView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: constant).isActive = true
            case .sidesHorizontal(let constant):
                self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: constant).isActive = true
                superView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: constant).isActive = true
            case .all(let constant):
                self.topAnchor.constraint(equalTo: superView.topAnchor, constant: constant).isActive = true
                superView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: constant).isActive = true
                self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: constant).isActive = true
                superView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: constant).isActive = true
                
            case .height(let constant):
                self.heightAnchor.constraint(equalToConstant: constant).isActive = true
            case .width(let constant):
                self.widthAnchor.constraint(equalToConstant: constant).isActive = true
            case .centerVertical(let constant):
                self.centerYAnchor.constraint(equalTo: superView.centerYAnchor, constant: constant).isActive = true
            case .centerHorizontal(let constant):
                self.centerXAnchor.constraint(equalTo: superView.centerXAnchor, constant: constant).isActive = true
            case .center:
                self.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
                self.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
            }
        }
        
    }

}

public extension UIView {
    
    func setCornerRadius(_ radius : CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func setBorder(_ color: UIColor, width: CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }

    func setRoundedCorners(_ corners: UIRectCorner, radius: CGFloat, viewWidth: CGFloat){
     
        var frame = self.bounds
        frame.size.width = viewWidth

        let path = UIBezierPath(roundedRect: frame, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
