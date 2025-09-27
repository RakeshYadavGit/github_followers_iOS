//
//  GFTextField.swift
//  GitHubFollowers
//
//  Created by Rakesh Yadav on 13/09/25.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.systemGray4.cgColor
        self.textColor = .label
        self.font = UIFont.preferredFont(forTextStyle: .title2)
        self.textAlignment = .center
        self.adjustsFontSizeToFitWidth = true
        self.minimumFontSize = 12
        self.backgroundColor = .tertiarySystemBackground
        self.autocorrectionType = .no
        self.returnKeyType = .go
        self.placeholder = "Enter your username..."
    }
    
}
