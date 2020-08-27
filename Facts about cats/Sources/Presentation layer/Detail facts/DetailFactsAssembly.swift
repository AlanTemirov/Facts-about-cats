//
//  DetailFactsAssembly.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

class DetailFactsAssembly {
    
    func assemblyDetailFacts(with fact: Fact) -> UIViewController {
        let detailFactsViewController = DetailFactsViewController(
            nibName: DetailFactsViewController.name,
            bundle: nil
        )
        detailFactsViewController.fact = fact
        
        return detailFactsViewController
        
    }
    
}
