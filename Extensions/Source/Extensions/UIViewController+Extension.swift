//
//  UIViewController+Extension.swift
//  Tawakkalna
//
//  Created by Heba Nageh on 01/01/1442 AH.
//  Copyright © 1442 Ministry of Health. All rights reserved.
//

import UIKit

public extension UIViewController {
    func addCloseButton(){
        let closeButton: UIBarButtonItem
               if #available(iOS 13.0, *) {
                   closeButton = UIBarButtonItem.init(barButtonSystemItem: .close, target: self, action: #selector(closeNavigationVC))
               } else {
                   closeButton = UIBarButtonItem.init(image: UIImage.init(named: "ic-close"), style: .plain, target: self, action: #selector(closeNavigationVC))
               }
        self.navigationController?.navigationBar.tintColor = .co_sea
        self.navigationItem.rightBarButtonItem = closeButton

    }
    @objc
    func closeNavigationVC() {
        self.dismiss(animated: true, completion: nil)
    }
}
