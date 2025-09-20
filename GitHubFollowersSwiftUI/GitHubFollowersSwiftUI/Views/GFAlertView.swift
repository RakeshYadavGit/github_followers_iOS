//
//  GFAlertView.swift
//  GitHubFollowersSwiftUI
//
//  Created by Rakesh Yadav on 18/09/25.
//

import SwiftUI

struct GFAlertView: View {
    
    let alertTitle: String
    let alertMessage: String
    let alertActionTitle: String
    
    var body: some View {
        
        VStack {
            VStack {
                GFTitleLabel(text: self.alertTitle, textAlignment: .center, fontSize: 20)
                GFBodyLabel(text: self.alertMessage, textAlignment: .center)
                GFButton(backgroundColor: Color(.systemPink), text: self.alertMessage) {
                    
                }
            }
            .frame(width: 280, height: 280)
        }
        .frame(minWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        .background(.opacity(0.75))
    }
}
