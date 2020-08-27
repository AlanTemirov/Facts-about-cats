//
//  MainFactsDataProvider.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

class MainFactsDataProvider: NSObject {
    
    var itemsProvider: MainFactsDataProviderProtocol!
    
    var didSelectFact: ItemClosure<Fact>?
    
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
