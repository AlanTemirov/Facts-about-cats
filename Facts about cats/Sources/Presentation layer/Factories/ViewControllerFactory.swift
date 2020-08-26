//
//  ViewControllerFactory.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

class ViewControllerFactory {
    
    private let embeddedContainer: EmbeddedContainer
    
    init(embeddedContainer: EmbeddedContainer) {
        self.embeddedContainer = embeddedContainer
    }
    
    func makeRootViewController() -> UIViewController {
        let mainFactsViewController = MainFactsViewController()
        return mainFactsViewController
    }
    
}
 
