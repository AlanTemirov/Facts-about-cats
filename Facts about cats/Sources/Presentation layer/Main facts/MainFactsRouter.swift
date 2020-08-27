//
//  MainFactsRouter.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation


protocol MainFactsRouterProtocol: RouteProtocol {
    
    func showFact(_ fact: FactModel)
    
}

extension MainFactsRouterProtocol {
    
    func showFact(_ fact: FactModel) {
        if let result =
            DetailFactsAssembly().assemblyDetailFacts(with: fact) as? DetailFactsViewController {
            result.fact = fact
            
            transitionHandler.pushModule(with: result, animated: true)
        }
    }
    
}
