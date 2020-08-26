//
//  MainFactsInteractor.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation

class MainFactsInteractor: MainFactsInteractorProtocol {
    
    private let coreDataManager: CoreDataManagerProtocol
    
    required init(coreDataManager: CoreDataManagerProtocol) {
        self.coreDataManager = coreDataManager
    }
    
}
