//
//  GFTextField.swift
//  GitHubFollowersSwiftUI
//
//  Created by Rakesh Yadav on 13/09/25.
//

import SwiftUI

struct GFTextField: View {
    
    @Binding private var userName: String
    private var onSumit: () -> Void
    
    init(userName: Binding<String>, onSumit: @escaping () -> Void) {
        self._userName = userName
        self.onSumit = onSumit
    }
    
    var body: some View {
        TextField("Enter your username...", text: self.$userName)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.tertiarySystemBackground))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(Color(.systemGray4), lineWidth: 2)
            )
            .font(Font.title2)
            .foregroundStyle(Color(.label))
            .multilineTextAlignment(.center)
            .autocorrectionDisabled(true)
            .submitLabel(.go)
            .minimumScaleFactor(0.5)
            .onSubmit {
                self.onSumit()
            }
    }
}

#Preview {
    GFTextField(userName: .constant("Rakesh")) {
        
    }
}
