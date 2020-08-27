//
//  UIView+Toast.swift
//  Facts about cats
//
//  Created by Alan on 27.08.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

extension UIView {
    
    func showToast(errorMessage: String, duration: TimeInterval) {
        let toastView = UIView()
        toastView.backgroundColor = .systemGray
        toastView.layer.cornerRadius = 10
        toastView.alpha = 1.0
        toastView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(toastView)
        bringSubviewToFront(toastView)
        
        NSLayoutConstraint.activate([
            toastView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            toastView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            toastView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            toastView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let errorLabel = UILabel()
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.font = .systemFont(ofSize: 14)
        errorLabel.textColor = .systemBackground
        errorLabel.text = "Error: \(errorMessage)"
        toastView.addSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            errorLabel.leadingAnchor.constraint(equalTo: toastView.leadingAnchor, constant: 8),
            errorLabel.trailingAnchor.constraint(equalTo: toastView.trailingAnchor, constant: -8),
            errorLabel.centerYAnchor.constraint(equalTo: toastView.centerYAnchor)
        ])
                    
         UIView.animate(
            withDuration: duration,
            delay: 1.5,
            options: [.curveEaseOut, .allowUserInteraction],
            animations: {
            toastView.alpha = 0.0
        }) { _ in
            toastView.removeFromSuperview()
        }
    }
    
}
