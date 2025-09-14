//
//  SearchView.swift
//  GitHubFollowersSwiftUI
//
//  Created by Rakesh Yadav on 13/09/25.
//

import SwiftUI

struct SearchView: View {
    
    @State private var userName: String = ""
    
    var body: some View {
        VStack {
            Image("gh-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.top, 80)

            
            GFTextField(userName: self.$userName) {
                debugPrint("\(userName)")
            }
            .padding(.horizontal, 50)
            .padding(.top, 48)
            
            
            Spacer()
            
            GFButton(backgroundColor: (Color(.systemGreen)), text: "Get Followers") {
                debugPrint("Button Tapped")
            }
            .padding(.horizontal, 50)
            .padding(.bottom, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

#Preview {
    SearchView()
}
