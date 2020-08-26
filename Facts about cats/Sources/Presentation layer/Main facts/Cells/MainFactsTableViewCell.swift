//
//  MainFactsTableViewCell.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

class MainFactsTableViewCell: UITableViewCell, NibLoadableProtocol {
    
    @IBOutlet private var factLabel: UILabel!
    
    func configure(with text: String?) {
        factLabel.text = text
    }
    
}
