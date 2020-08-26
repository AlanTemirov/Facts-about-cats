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
    
    func onAppear() {
        view.setLoading(true)
        fetchFacts()
        requestFacts()
    }
    
    func onRefresh() {
        view.setLoading(true)
        requestFacts()
    }
    
}

// MARK: - Private
private extension MainFactsPresenter {
    
    func fetchFacts() {
        interactor.fetchFacts { [weak self] facts, coredataErrors in
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
    
    func item(at index: Int) -> Fact? {
        guard facts.indices.contains(index) else { return nil }
        return facts[index]
    }
    
}
