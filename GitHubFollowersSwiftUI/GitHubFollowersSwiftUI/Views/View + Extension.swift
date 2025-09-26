//
//  View + Extension.swift
//  GitHubFollowersSwiftUI
//
//  Created by Rakesh Yadav on 20/09/25.
//

import SwiftUICore


extension View {
    func presentAlert(isPresented: Binding<Bool>, title: String, message: String, buttonTitle: String) -> some View {
        self.modifier(GFAlertPresenter(isPresented: isPresented, title: title, message: message, buttonTitle: buttonTitle))
    }
}

struct GFAlertPresenter: ViewModifier {
    
    @Binding var isPresented: Bool
    let title: String
    let message: String
    let buttonTitle: String
    
    func body(content: Content) -> some View {
        content.overlay(content: {
            if self.isPresented {
                GFAlertView(alertTitle: self.title, alertMessage: self.message, alertActionTitle: self.buttonTitle) {
                    self.isPresented.toggle()
                }
            }
        })
    }
    
}


