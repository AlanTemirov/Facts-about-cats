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
        
        configureView()
        configureTableView()
        
        presenter.onAppear()
    }
    
    func reloadFacts() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

// MARK: - Private
private extension MainFactsViewController {
    
    func configureView() {
        title = "Facts"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        
        tableView.register(
            MainFactsTableViewCell.nib,
            forCellReuseIdentifier: MainFactsTableViewCell.identifier
        )
    }
    
}
