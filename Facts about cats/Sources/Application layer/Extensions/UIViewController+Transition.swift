//
//  UIViewController+Transition.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

public protocol TransitionHandler: AnyObject {
    
    func pushModule(with viewController: UIViewController, animated: Bool)
    
}

public extension TransitionHandler where Self: UIViewController {
    
    func pushModule(with viewController: UIViewController, animated: Bool = true) {
        DispatchQueue.main.async {
            if let parentNavigationController = self.parent as? UINavigationController {
                parentNavigationController.pushViewController(viewController, animated: animated)
            } else if let navigationController = self as? UINavigationController {
                navigationController.pushViewController(viewController, animated: animated)
            }
        }
    }
    
}

