//
//  RouterProtocol.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation

protocol RouteProtocol: AnyObject {
    
    var transitionHandler: TransitionHandler! { get }
    
}
