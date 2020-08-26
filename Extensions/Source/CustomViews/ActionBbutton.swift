//
//  ActionBbutton.swift
//  Tawakkalna
//
//  Created by Aziz Dev on 25/04/2020.
//  Copyright © 2020 Ministry of Health. All rights reserved.
//

import UIKit

class ActionButton: UIButton {
    var touchUp: ((_ button: UIButton) -> ())?
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
       setupButton()
    }

    func setupButton() {
        //this is my most common setup, but you can customize to your liking
        addTarget(self, action: #selector(touchUpInside), for: [.touchUpInside])
    }

    //actions
    @objc func touchUpInside(sender: UIButton) {
        touchUp?(sender)
    }
    
    deinit {
        print("ActionButton deinit")
    }
}
