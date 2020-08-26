//
//  Extension+UITableView.swift
//  Tawakkalna
//
//  Created by Aziz Dev on 25/04/2020.
//  Copyright © 2020 Ministry of Health. All rights reserved.
//

import UIKit

public extension UITableView {
    
    func removePlaceHolder(){
        self.viewWithTag(1001)?.removeFromSuperview()
    }
    
    func placeHolder(icon: UIImage?,
                     title: String,
                     buttonTitle: String? = nil,
                     buttonAction: (()->())? = nil){
        
            removePlaceHolder()

            let icon = UIImageView(image: icon)
            icon.contentMode = .scaleAspectFit
            icon.tintColor = UIColor(hex: "D4D8DC")
            
            let label = UILabel()
            label.numberOfLines = 2
            label.textColor = UIColor.gray
            label.text = title
            label.textAlignment = .center

            
            let stack = UIStackView(arrangedSubviews: [icon,label])
            stack.tag = 1001
            stack.axis = .vertical
            stack.spacing = 8
            stack.alignment = .center
            stack.distribution = .fill
            
            
            if let btnTitle = buttonTitle,
                let btnAction = buttonAction {
                
                let spaceView = UIView()
                spaceView.backgroundColor = .clear
                stack.insertArrangedSubview(spaceView, at: 0)
                stack.addArrangedSubview(spaceView)
                spaceView.setConstrint([.height(100)])

                
                let actionButton = ActionButton(frame: CGRect.zero)
                actionButton.touchUp = { [weak self] button in
                    guard self != nil else { return }
                    btnAction()
                    stack.removeFromSuperview()
                }
                actionButton.setTitle(btnTitle, for: .normal)
                actionButton.setTitleColor(UIColor.white, for: .normal)
                actionButton.backgroundColor = UIColor.co_sea
                stack.addArrangedSubview(actionButton)
                actionButton.setConstrint([.height(50),.width(50)])
                actionButton.setCornerRadius(25)
            }
            
                      
            self.addSubview(stack)
            
            icon.setConstrint([.height(40),.width(40)])
            
            stack.setConstrint([.center,.sidesHorizontal(20)])
        
    }

}
