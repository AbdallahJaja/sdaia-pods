//
//  UIWindow+Extension.swift
//  Skeltone
//
//  Created by Saleh AlDhobaie on 07/03/2020.
//  Copyright © 2020 Saleh AlDhobaie. All rights reserved.
//

import Foundation
import UIKit

public extension UIWindow {

    func showRootViewController(_ controller: UIViewController, options: TransitionOptions = TransitionOptions()) {
        let transitionWindow = UIWindow(frame: UIScreen.main.bounds)
        transitionWindow.backgroundColor = options.backgroundColor
        transitionWindow.makeKeyAndVisible()

        // Make animation
        layer.add(options.animation, forKey: kCATransition)
        rootViewController = controller
        makeKeyAndVisible()

        DispatchQueue.main.asyncAfter(deadline: (.now() + 1 + options.duration), execute: {
            transitionWindow.removeFromSuperview()
        })
    }
}

public struct TransitionOptions {
    enum Direction {
        case fade
        case show
        case hide
        case pop
        case push

        func transition() -> CATransition {
            let transition = CATransition()
			transition.type = CATransitionType.push
            switch self {
            case .fade:
				transition.type = CATransitionType.fade
                transition.subtype = nil
            case .pop:
				transition.subtype = CATransitionSubtype.fromLeft
            case .push:
				transition.subtype = CATransitionSubtype.fromRight
            case .show:
				transition.subtype = CATransitionSubtype.fromTop
            case .hide:
				transition.subtype = CATransitionSubtype.fromBottom
            }
            return transition
        }
    }

    var duration: TimeInterval = 0.25
    var direction: TransitionOptions.Direction = .fade
    var backgroundColor: UIColor = .white

    init(direction: TransitionOptions.Direction = .fade) {
        self.direction = direction
    }

    public init() { }

    var animation: CATransition {
        let transition = self.direction.transition()
        transition.duration = self.duration
		transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        return transition
    }
}

public extension UIApplication {
class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
    if let navigationController = controller as? UINavigationController {
        return topViewController(controller: navigationController.visibleViewController)
    }
    if let tabController = controller as? UITabBarController {
        if let selected = tabController.selectedViewController {
            return topViewController(controller: selected)
        }
    }
    if let presented = controller?.presentedViewController {
        return topViewController(controller: presented)
    }
    return controller
} }
