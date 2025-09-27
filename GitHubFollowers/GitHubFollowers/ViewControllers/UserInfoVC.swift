//
//  UserInfoVC.swift
//  GitHubFollowers
//
//  Created by Rakesh Yadav on 27/09/25.
//

import UIKit

class UserInfoVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        let doneButton: UIBarButtonItem = .init(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func dismissVC() {
        self.dismiss(animated: true)
    }
}
