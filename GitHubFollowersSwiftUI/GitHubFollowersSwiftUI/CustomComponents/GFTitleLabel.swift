//
//  GFLabel.swift
//  GitHubFollowersSwiftUI
//
//  Created by Rakesh Yadav on 18/09/25.
//

import SwiftUI

struct GFTitleLabel: View {
    
    let textAlignment: TextAlignment
    let fontSize: CGFloat
    let text: String
    
    init(text: String, textAlignment: TextAlignment, fontSize: CGFloat) {
        self.textAlignment = textAlignment
        self.fontSize = fontSize
        self.text = text
    }
    
    var body: some View {
        Text(self.text)
            .font(Font.system(size: self.fontSize, weight: .bold))
            .foregroundStyle(Color(.label))
            .multilineTextAlignment(self.textAlignment)
            .lineLimit(1)
            .truncationMode(.tail)
            .minimumScaleFactor(0.9)
    }
}
