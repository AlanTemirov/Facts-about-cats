//
//  MainFactsPresenter.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import Foundation

class MainFactsPresenter: MainFactsPresenterProtocol, MainFactsRouterProtocol {
    
    weak var view: MainFactsViewProtocol!
    weak var transitionHandler: TransitionHandler!
    var interactor: MainFactsInteractorProtocol!
    
    private var facts: [FactModel] = []
    
    func onAppear() {
        view.setLoading(true)
        fetchFacts()
        requestFacts()
    }
    
    func onRefresh() {
        view.setLoading(true)
        requestFacts()
    }
    
    func didSelectFact(_ fact: FactModel) {
        showFact(fact)
    }
    
}

// MARK: - Private
private extension MainFactsPresenter {
    
    func fetchFacts() {
        interactor.obtainFacts { [weak self] facts, coredataError in
            if let error = coredataError {
                self?.view.showError(error.localizedDescription)
            }
            
            if let facts = facts {
                self?.facts = facts
                self?.view.reloadFacts()
                if facts.count > 0  {
                    self?.view.setLoading(false)
                }
            } else {
                self?.view.setLoading(false)
            }
        }
    }
    
    func requestFacts() {
        interactor.loadFacts(url: FactsAPI.url) { [weak self] facts, error in
            if let error = error {
                self?.view.showError(error.localizedDescription)
            }
            
            if let facts = facts {
                self?.facts = facts
                self?.view.reloadFacts()
                self?.view.setLoading(false)
            } else {
                self?.view.setLoading(false)
            }
            
        }
    }
}

// MARK: - MainFactsDataProviderProtocol
extension MainFactsPresenter: MainFactsDataProviderProtocol {
    
    var count: Int {
        facts.count
    }
    
    func item(at index: Int) -> FactModel? {
        guard facts.indices.contains(index) else { return nil }
        return facts[index]
    }
    
}
