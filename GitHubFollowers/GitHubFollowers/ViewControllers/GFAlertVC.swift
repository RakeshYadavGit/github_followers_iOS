//
//  GFAlertVC.swift
//  GitHubFollowers
//
//  Created by Rakesh Yadav on 15/09/25.
//

import UIKit

class GFAlertVC: UIViewController {
    
    let containerView: UIView = UIView()
    let titleLable: GFTitleLabel = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLable: GFBodyLabel = GFBodyLabel(textAlignment: .center)
    let actionButton: GFButton = GFButton(backgroundColor: .systemPink, text: "OK")
    
    let padding: CGFloat = 20
    
    var alertTitle: String?
    var alertMessage: String?
    var alertActionTitle: String?
    
    init(alertTitle: String, alertMessage: String, alertActionTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.alertMessage = alertMessage
        self.alertActionTitle = alertActionTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        self.configureContainerView()
        self.configureTitleLabel()
        self.configureActionButtons()
        self.configureMessageLable()
    }
    
    private func configureContainerView() {
        self.view.addSubview(self.containerView)
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        self.containerView.backgroundColor = .systemBackground
        self.containerView.layer.cornerRadius = 16
        self.containerView.layer.borderWidth = 2
        self.containerView.layer.borderColor = UIColor.white.cgColor
        
        NSLayoutConstraint.activate([
            self.containerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.containerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.containerView.widthAnchor.constraint(equalToConstant: 280),
            self.containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    private func configureTitleLabel() {
        self.containerView.addSubview(self.titleLable)
        self.titleLable.text = self.alertTitle ?? "Something went wrong"
        
        NSLayoutConstraint.activate([
            self.titleLable.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: self.padding),
            self.titleLable.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: self.padding),
            self.titleLable.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -self.padding),
            self.titleLable.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    private func configureActionButtons() {
        self.containerView.addSubview(self.actionButton)
        self.actionButton.setTitle(self.alertActionTitle ?? "Ok", for: .normal)
        self.actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            self.actionButton.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -self.padding),
            self.actionButton.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: self.padding),
            self.actionButton.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -self.padding),
            self.actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func configureMessageLable() {
        self.containerView.addSubview(self.messageLable)
        self.messageLable.text = self.alertMessage ?? "Unable to process your request. Please try again later."
        self.messageLable.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            self.messageLable.topAnchor.constraint(equalTo: self.titleLable.bottomAnchor, constant: 8),
            self.messageLable.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: self.padding),
            self.messageLable.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -self.padding),
            self.messageLable.bottomAnchor.constraint(equalTo: self.actionButton.topAnchor, constant: -12)
        ])
    }
    
    @objc private func dismissVC() {
        self.dismiss(animated: true)
    }
    
}
