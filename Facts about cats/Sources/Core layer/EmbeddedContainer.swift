//
//  EmbeddedContainer.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation

protocol EmbeddedContainerProtocol {
    
    var coreDataManager: CoreDataManagerProtocol { get }
    
}

class EmbeddedContainer {
    
    private(set) var coreDataManager: CoreDataManagerProtocol
    
    init(coreDataManager: CoreDataManagerProtocol = CoreDataManager()) {
        self.coreDataManager = coreDataManager
    }
    
}
