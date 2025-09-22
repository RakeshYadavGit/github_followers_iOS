//
//  FollowerCell.swift
//  GitHubFollowers
//
//  Created by Rakesh Yadav on 22/09/25.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "FollowerCell"
    
    let avatarImageView: GFAvatarImage = GFAvatarImage(frame: .zero)
    let userNameLabel: GFTitleLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    let padding: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder?) {
        fatalError( "init(coder:) has not been implemented" )
    }
    
    func set(follower: Follower) {
        self.userNameLabel.text = follower.login
    }
    
    private func configure() {
        self.addAvatarImageView()
        self.addUserNameLabel()
    }
    
    private func addAvatarImageView() {
        self.addSubview(self.avatarImageView)
        
        NSLayoutConstraint.activate([
            self.avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            self.avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            self.avatarImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            self.avatarImageView.heightAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
    
    private func addUserNameLabel() {
        self.addSubview(self.userNameLabel)
        
        NSLayoutConstraint.activate([
            self.userNameLabel.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 12),
            self.userNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            self.userNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            self.userNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
