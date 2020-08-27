//
//  UIViewController+Loading.swift
//  Facts about cats
//
//  Created by Alan on 26.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showLoading() {
        if !isLoading {
            let loadingView = LoadingView()
            loadingView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(loadingView)
            view.bringSubviewToFront(loadingView)
            
            NSLayoutConstraint.activate([
                loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                loadingView.widthAnchor.constraint(equalToConstant: 72),
                loadingView.heightAnchor.constraint(equalToConstant: 72)
            ])
        }
    }
    
    func hideLoading() {
        if isLoading {
            view.subviews.filter { $0 is LoadingView }.forEach { $0.removeFromSuperview() }
        }
    }
    
    private var isLoading: Bool {
        view.subviews.contains(where: { $0 is LoadingView })
    }
    
}

class LoadingView: UIView {
    
    fileprivate var activityIndicator: UIActivityIndicatorView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit() {
        layer.cornerRadius = 8
        layer.backgroundColor = UIColor.darkGray.withAlphaComponent(0.90).cgColor
        
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.startAnimating()
        activityIndicator.color = .white
        addSubview(activityIndicator)
        bringSubviewToFront(activityIndicator)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        activityIndicator.center = CGPoint(x: bounds.width * 0.5, y: bounds.height * 0.5)
    }
    
}

