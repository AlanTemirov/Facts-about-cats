//
//  UIViewController+Utils.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Returns the `String` value of ViewController name.
    static var name: String {
        String(describing: self)
    }
    
}
