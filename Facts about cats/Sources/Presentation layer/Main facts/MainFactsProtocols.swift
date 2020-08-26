//
//  MainFactsProtocols.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation

protocol MainFactsViewProtocol: AnyObject {
    
    var presenter: MainFactsPresenterProtocol! { get set }
    
}


protocol MainFactsPresenterProtocol {
    
    var view: MainFactsViewProtocol! { get set }
    
    var interactor: MainFactsInteractorProtocol! { get set }
    
}


protocol MainFactsInteractorProtocol {
    
    init(coreDataManager: CoreDataManagerProtocol)
    
}

protocol MainFactsDataProviderProtocol {
    
    var count: Int { get }
    
}
