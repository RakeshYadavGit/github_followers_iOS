//
//  FollowerListVC.swift
//  GitHubFollowers
//
//  Created by Rakesh Yadav on 14/09/25.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
