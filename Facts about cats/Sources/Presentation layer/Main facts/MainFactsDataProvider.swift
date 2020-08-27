//
//  MainFactsDataProvider.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

/// Data provider for implement `TableView` data source & delegate.
class MainFactsDataProvider: NSObject {
    
    var itemsProvider: MainFactsDataProviderProtocol!
    
    /// Closure to indicate when `FactModel` did selected.
    var didSelectFact: ItemClosure<FactModel>?
    
}

// MARK: - UITableViewDataSource
extension MainFactsDataProvider: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemsProvider.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MainFactsTableViewCell.identifier,
            for: indexPath
            ) as? MainFactsTableViewCell else {
                return UITableViewCell()
        }
        
        cell.configure(with: itemsProvider.item(at: indexPath.row)?.text)
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension MainFactsDataProvider: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let fact = itemsProvider.item(at: indexPath.row) {
            didSelectFact?(fact)
        }
    }
    
}
