//
//  SeachVCView.swift
//  GitHubFollowers
//
//  Created by Rakesh Yadav on 13/09/25.
//

import UIKit

class SeachVC: UIViewController {
    
    let logoImageView: UIImageView = UIImageView()
    let gfTextField: GFTextField = GFTextField()
    let gfButton: GFButton = GFButton(backgroundColor: .systemGreen, text: "Get Followers")

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
        self.navigationController?.isNavigationBarHidden = true
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
        
        self.view.addSubview(self.gfTextField)
        self.gfTextField.delegate = self
        
        NSLayoutConstraint.activate([
            self.gfTextField.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 48),
            self.gfTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            self.gfTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            self.gfTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureGFButton() {
        self.view.addSubview(self.gfButton)
        
        NSLayoutConstraint.activate([
            self.gfButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            self.gfButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
            self.gfButton.heightAnchor.constraint(equalToConstant: 50),
            self.gfButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
    
    private func createTapGestureRecognizer() {
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }

}


extension SeachVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        debugPrint("print \(textField.text)")
        return true
    }
}
