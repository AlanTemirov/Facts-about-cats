//
//  MainFactsPresenter.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation

class MainFactsPresenter: MainFactsPresenterProtocol {
    
    weak var view: MainFactsViewProtocol!
    
    var interactor: MainFactsInteractorProtocol!
    
    private var facts: [Fact] = []
    
}

// MARK: - MainFactsDataProviderProtocol
extension MainFactsPresenter: MainFactsDataProviderProtocol {
    
    var count: Int {
        facts.count
    }
    
}
