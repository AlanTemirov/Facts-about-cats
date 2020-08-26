//
//  ViewControllerFactory.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

class ViewControllerAssembly {
    
    private let embeddedContainer: EmbeddedContainer
    
    init(embeddedContainer: EmbeddedContainer) {
        self.embeddedContainer = embeddedContainer
    }
    
    func makeRootViewController() -> UIViewController {
        let mainFactsViewController = MainFactsViewController(
            nibName: MainFactsViewController.name,
            bundle: nil
        )
        let mainFactsPresenter = MainFactsPresenter()
        let mainFactsInteractor =
            MainFactsInteractor(coreDataManager: embeddedContainer.coreDataManager)
        let mainFactsDataProvider = MainFactsDataProvider()
        
        mainFactsViewController.presenter = mainFactsPresenter
        mainFactsViewController.dataProvider = mainFactsDataProvider
        
        mainFactsPresenter.view = mainFactsViewController
        mainFactsPresenter.interactor = mainFactsInteractor
        
        mainFactsDataProvider.itemsProvider = mainFactsPresenter
        
        return mainFactsViewController
    }
    
    func makeDetailFactsViewController() -> UIViewController {
        let result = DetailFactsViewController()
        return result
    }
    
}
