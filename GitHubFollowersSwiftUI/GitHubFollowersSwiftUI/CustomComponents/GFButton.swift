//
//  GFButton.swift
//  GitHubFollowersSwiftUI
//
//  Created by Rakesh Yadav on 13/09/25.
//

import SwiftUI

struct GFButton: View {
    
    let backgroundColor: Color
    let text: String
    let action: () -> Void
    
    init(backgroundColor: Color, text: String, action: @escaping () -> Void) {
        self.backgroundColor = backgroundColor
        self.text = text
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.headline)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(self.backgroundColor)
                .cornerRadius(10)
        }

    }
}

#Preview {
    GFButton(backgroundColor: .green, text: "Get Followers") {
        debugPrint("Get Followers")
    }
}
