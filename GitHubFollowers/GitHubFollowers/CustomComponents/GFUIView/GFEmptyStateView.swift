//
//  GFEmptyStateView.swift
//  GitHubFollowers
//
//  Created by Rakesh Yadav on 27/09/25.
//

import UIKit

class GFEmptyStateView: UIView {
    
    let messageLabel: GFTitleLabel = .init(textAlignment: .center, fontSize: 28)
    let logoImageView: UIImageView = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder?) {
        fatalError("")
    }
    
    init(message: String) {
        super.init(frame: .zero)
        messageLabel.text = message
        self.configure()
    }
    
    private func configure() {
        self.configureMessageLabel()
        self.configureLogoImageView()
    }
    
    private func configureMessageLabel() {
        self.addSubview(self.messageLabel)
        self.messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.messageLabel.numberOfLines = 3
        self.messageLabel.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            self.messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            self.messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            self.messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            self.messageLabel.heightAnchor.constraint(equalToConstant: 200)
            
        ])
    }
    
    private func configureLogoImageView() {
        self.addSubview(self.logoImageView)
        self.logoImageView.image = UIImage(named: "empty-state-logo")
        self.logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            self.logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            self.logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
            self.logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 40)
        ])
    }
}
