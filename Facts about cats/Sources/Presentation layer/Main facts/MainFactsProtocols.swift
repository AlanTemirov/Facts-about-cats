//
//  MainFactsProtocols.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation

/// Interface of View.
protocol MainFactsViewProtocol: TransitionHandler {
    
    /// Presenter to be used.
    var presenter: MainFactsPresenterProtocol! { get set }
    
    /// Reloads table view.
    func reloadFacts()
    
    /// Set activity indicator loading state.
    ///
    /// - Parameter loading: The bool indicator to define stop or not.
    func setLoading(_ loading: Bool)
    
    /// Show errors message.
    ///
    /// - Parameter error: The error message to be displayed.
    func showError(_ error: String)
    
}

/// Interface of Presenter.
protocol MainFactsPresenterProtocol {
    
    /// View to be used.
    var view: MainFactsViewProtocol! { get set }
    
    /// Interactor to be used.
    var interactor: MainFactsInteractorProtocol! { get set }
    
    /// Method to indicates when view appears.
    func onAppear()
    
    /// Method to indicates when view is refreshing.
    func onRefresh()
    
    /// Proxy action of selecting specific fact.
    ///
    /// - Parameter fact: The selected fact.
    func didSelectFact(_ fact: FactModel)
    
}

/// Interface of Interactor.
protocol MainFactsInteractorProtocol {
    
    init(coreDataManager: CoreDataManagerProtocol,
         networkService: NetworkServiceProtocol)
    
    /// Loading facts by specific url. 
    func loadFacts(url: String, completion: @escaping ItemsClosure<[FactModel]?, Error?>)
    
    /// Fetch facts.
    func obtainFacts(completion: @escaping ItemsClosure<[FactModel]?, CoreDataErrors?>)
    
    
}

/// Interface of Data provider.
protocol MainFactsDataProviderProtocol {
    
    /// Count of items to be displayed.
    var count: Int { get }
    
    /// A fact model at specific index.
    func item(at index: Int) -> FactModel?
    
}
