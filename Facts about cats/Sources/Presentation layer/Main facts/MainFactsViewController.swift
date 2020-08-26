//
//  MainFactsViewController.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

class MainFactsViewController: UIViewController, MainFactsViewProtocol {
    
    @IBOutlet private var tableView: UITableView!
    
    var presenter: MainFactsPresenterProtocol!
    var dataProvider: MainFactsDataProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
}

// MARK: - Private
private extension MainFactsViewController {
    
    func configureTableView() {
        tableView.dataSource = dataProvider
        
        tableView.register(
            MainFactsTableViewCell.nib,
            forCellReuseIdentifier: MainFactsTableViewCell.identifier
        )
    }
    
}
