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
    
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureTableView()
        configureRefreshControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.onAppear()
    }
    
    func reloadFacts() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setLoading(_ loading: Bool) {
        DispatchQueue.main.async {
            loading ? self.showLoading() : self.hideLoading()
            if !loading && self.refreshControl.isRefreshing {
                self.refreshControl.endRefreshing()
            }
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
    
    func configureRefreshControl() {
        refreshControl.addTarget(self,
                                 action: #selector(refresh),
                                 for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc func refresh() {
        refreshControl.beginRefreshing()
        presenter.onRefresh()
    }
    
}
