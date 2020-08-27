//
//  MainFactsProtocols.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation

protocol MainFactsViewProtocol: TransitionHandler {
    
    var presenter: MainFactsPresenterProtocol! { get set }
    
    func reloadFacts()
    
    func setLoading(_ loading: Bool)
    
    func showError(_ error: String)
    
}


protocol MainFactsPresenterProtocol {
    
    var view: MainFactsViewProtocol! { get set }
    
    var interactor: MainFactsInteractorProtocol! { get set }
    
    func onAppear()
    
    func onRefresh()
    
    func didSelectFact(_ fact: FactModel)
    
}


protocol MainFactsInteractorProtocol {
    
    init(coreDataManager: CoreDataManagerProtocol,
         networkService: NetworkServiceProtocol)
    
    func loadFacts(url: String, completion: @escaping ItemsClosure<[FactModel]?, Error?>)
    
    func obtainFacts(completion: @escaping ItemsClosure<[FactModel]?, CoreDataErrors?>)
    
    
}

protocol MainFactsDataProviderProtocol {
    
    var count: Int { get }
    
    func item(at index: Int) -> FactModel?
    
}
