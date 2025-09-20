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
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: self.userName, page: 1) { followers, errorMessage in
            
            guard let followers: [Follower] = followers else {
                self.presentGFAlertOnMainThread(title: "Bad Request", message: errorMessage!.rawValue, buttonTitle: "Ok")
                return
            }
            
            print("follower count \(followers.count)")
            print("follower \(followers)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}
