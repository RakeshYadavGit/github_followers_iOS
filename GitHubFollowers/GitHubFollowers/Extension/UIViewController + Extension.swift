//
//  UIViewController + Extension.swift
//  GitHubFollowers
//
//  Created by Rakesh Yadav on 15/09/25.
//

import UIKit

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        let alertVC: GFAlertVC = GFAlertVC(alertTitle: title, alertMessage: message, alertActionTitle: buttonTitle)
        
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        
        DispatchQueue.main.async {
            self.present(alertVC, animated: true)
        }
    }
}
