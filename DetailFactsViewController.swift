//
//  DetailFactsViewController.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

class DetailFactsViewController: UIViewController {
    
    @IBOutlet private var authorLabel: UILabel!
    @IBOutlet private var detailFactTextView: UITextView!
    @IBOutlet private var upvotesLabel: UILabel!
    
    var fact: Fact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureElements()
    }
    
    func configureElements() {
        guard let fact = fact else {
            return
        }
        authorLabel.text = fact.user
        detailFactTextView.text = fact.text
        upvotesLabel.text = String(fact.upvotes)
    }
    
}
