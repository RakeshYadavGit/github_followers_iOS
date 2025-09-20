//
//  SeachVCView.swift
//  GitHubFollowers
//
//  Created by Rakesh Yadav on 13/09/25.
//

import UIKit

class SeachVC: UIViewController {
    
    let logoImageView: UIImageView = UIImageView()
    let userNameTextField: GFTextField = GFTextField()
    let getFollowers: GFButton = GFButton(backgroundColor: .systemGreen, text: "Get Followers")
    
    var isUserNameEntered: Bool {
        return !(self.userNameTextField.text?.isEmpty ?? true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        self.congifureLogoImageView()
        self.configureGFTextField()
        self.configureGFButton()
        self.createTapGestureRecognizer()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func congifureLogoImageView() {
        
        self.view.addSubview(self.logoImageView)
        self.logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.logoImageView.image = UIImage(named: "gh-logo")
        NSLayoutConstraint.activate([
            self.logoImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 80),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 200),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureGFTextField() {
        
        self.view.addSubview(self.userNameTextField)
        self.userNameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            self.userNameTextField.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 48),
            self.userNameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            self.userNameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            self.userNameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureGFButton() {
        self.view.addSubview(self.getFollowers)
        
        self.getFollowers.addTarget(self, action: #selector(self.pushFollowerVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            self.getFollowers.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            self.getFollowers.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            self.getFollowers.heightAnchor.constraint(equalToConstant: 50),
            self.getFollowers.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
    
    private func createTapGestureRecognizer() {
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func pushFollowerVC() {
        
        guard self.isUserNameEntered else {
            self.presentGFAlertOnMainThread(title: "Empty User Name", message: "Please enter a user name. It cannot be empty 😙", buttonTitle: "Ok")
            return
        }
        
        let followerVC: FollowerListVC = .init()
        followerVC.userName = self.userNameTextField.text
        followerVC.title = self.userNameTextField.text
        self.navigationController?.pushViewController(followerVC, animated: true)
    }

}


extension SeachVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.pushFollowerVC()
        return true
    }
}
