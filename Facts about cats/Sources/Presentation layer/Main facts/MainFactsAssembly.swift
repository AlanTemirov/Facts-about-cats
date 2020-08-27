//
//  ViewControllerFactory.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

class MainFactsAssembly {
    
    private let embeddedContainer: EmbeddedContainer
    
    init(embeddedContainer: EmbeddedContainer) {
        self.embeddedContainer = embeddedContainer
    }
    
    func assemblyMainFacts() -> UIViewController {
        let mainFactsViewController = MainFactsViewController(
            nibName: MainFactsViewController.name,
            bundle: nil
        )
        let mainFactsPresenter = MainFactsPresenter()
        let networkService = NetworkService()
        let mainFactsInteractor = MainFactsInteractor(
            coreDataManager: embeddedContainer.coreDataManager,
            networkService: networkService
        )
        let mainFactsDataProvider = MainFactsDataProvider()
        
        mainFactsViewController.presenter = mainFactsPresenter
        mainFactsViewController.dataProvider = mainFactsDataProvider
        
        mainFactsPresenter.view = mainFactsViewController
        mainFactsPresenter.transitionHandler = mainFactsViewController
        mainFactsPresenter.interactor = mainFactsInteractor
        
        mainFactsDataProvider.itemsProvider = mainFactsPresenter
        
        return UINavigationController(rootViewController: mainFactsViewController)
    }
    
}
