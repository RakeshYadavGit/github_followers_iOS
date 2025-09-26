//
//  GFButton.swift
//  GitHubFollowers
//
//  Created by Rakesh Yadav on 13/09/25.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, text: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(text, for: .normal)
        self.configure()
    }
    
    
    private func configure() {
        self.layer.cornerRadius = 10
        self.titleLabel?.textColor = .white
        self.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        self.translatesAutoresizingMaskIntoConstraints = false
    }

}
