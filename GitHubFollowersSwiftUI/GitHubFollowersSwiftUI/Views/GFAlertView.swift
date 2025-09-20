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
    let dismiss: () -> Void
    
    let padding: CGFloat = 20.0
    
    init(alertTitle: String, alertMessage: String, alertActionTitle: String, dismiss: @escaping () -> Void) {
        self.alertTitle = alertTitle
        self.alertMessage = alertMessage
        self.alertActionTitle = alertActionTitle
        self.dismiss = dismiss
    }
    
    var body: some View {
        
        VStack {
            VStack {
                GFTitleLabel(text: self.alertTitle, textAlignment: .center, fontSize: 20)
                    .padding(EdgeInsets(top: padding, leading: padding, bottom: 0, trailing: padding))
                    .frame(height: 28)
                
                GFBodyLabel(text: self.alertMessage, textAlignment: .center)
                    .lineLimit(4)
                    .padding(EdgeInsets(top: 12, leading: padding, bottom: 8, trailing: padding))
                
                GFButton(backgroundColor: Color(.systemPink), text: self.alertActionTitle) {
                    self.dismiss()
                }
                .frame(height: 44)
                .padding(EdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding))
            }
            .background(
               RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth: 2.0)
                .fill(Color(.systemBackground))
            )
            .padding(.horizontal, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.75))

    }
}

#Preview {
    GFAlertView(alertTitle: "Error", alertMessage: "Please try again later", alertActionTitle: "OK") {
        
    }
}
