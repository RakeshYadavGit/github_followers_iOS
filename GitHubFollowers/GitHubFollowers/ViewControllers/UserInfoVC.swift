//
//  UserInfoVC.swift
//  GitHubFollowers
//
//  Created by Rakesh Yadav on 27/09/25.
//

import UIKit

class UserInfoVC: UIViewController {
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        let doneButton: UIBarButtonItem = .init(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        
        NetworkManager.shared.getUser(for: userName) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    @objc private func dismissVC() {
        self.dismiss(animated: true)
    }
}
