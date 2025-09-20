//
//  GFBodyLabel.swift
//  GitHubFollowersSwiftUI
//
//  Created by Rakesh Yadav on 18/09/25.
//

import SwiftUI

struct GFBodyLabel: View {
    
    let text: String
    let textAlignment: TextAlignment
    
    init(text: String, textAlignment: TextAlignment) {
        self.text = text
        self.textAlignment = textAlignment
    }
    
    var body: some View {
        Text(self.text)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(self.textAlignment)
            .font(.body)
            .truncationMode(.tail)
            .minimumScaleFactor(0.75)
    }
}
