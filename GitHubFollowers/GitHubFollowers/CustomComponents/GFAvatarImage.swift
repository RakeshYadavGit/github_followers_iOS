//
//  GFAvatarImage.swift
//  GitHubFollowers
//
//  Created by Rakesh Yadav on 22/09/25.
//

import UIKit

class GFAvatarImage: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder?) {
        fatalError( "init(coder:) has not been implemented" )
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10
        self.clipsToBounds      = true
        self.image              = UIImage(named: "avatar-placeholder")!
        
        
    }
}
