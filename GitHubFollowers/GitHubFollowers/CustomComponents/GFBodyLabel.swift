//
//  GFBodyLabel.swift
//  GitHubFollowers
//
//  Created by Rakesh Yadav on 14/09/25.
//

import UIKit

class GFBodyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError( "init(coder:) has not been implemented" )
    }
    
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.configure()
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .label
        self.font = UIFont.preferredFont(forTextStyle: .body)
        self.lineBreakMode = .byWordWrapping
        self.minimumScaleFactor = 0.75
        self.adjustsFontSizeToFitWidth = true
        
    }
}
