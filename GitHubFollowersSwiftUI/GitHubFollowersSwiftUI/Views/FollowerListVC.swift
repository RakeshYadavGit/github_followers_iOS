//
//  FollowerListVC.swift
//  GitHubFollowersSwiftUI
//
//  Created by Rakesh Yadav on 20/09/25.
//

import SwiftUI

struct FollowerListVC: View {
    
    let userName: String
    @State var showAlert: Bool = false
    @State var error: GFError = .invalidResponse
    
    init(userName: String) {
        self.userName = userName
    }
    
    var body: some View {
        VStack {
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle(self.userName)
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            NetworkManager.shared.getFollowers(for: self.userName, page: 1) { result in
                switch result {
                case .success(let followers):
                    debugPrint("follower \(followers)")
                case .failure(let error):
                    self.error = error
                    self.showAlert = true
                }
            }
        }
        .presentAlert(isPresented: self.$showAlert, title: "Error", message: self.error.rawValue, buttonTitle: "OK")
    }
    
}
