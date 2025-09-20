//
//  FollowerListVC.swift
//  GitHubFollowersSwiftUI
//
//  Created by Rakesh Yadav on 20/09/25.
//

import SwiftUI

struct FollowerListVC: View {
    
    let userName: String
    
    init(userName: String) {
        self.userName = userName
    }
    
    var body: some View {
        VStack {
            
        }
        .navigationTitle(self.userName)
        .navigationBarTitleDisplayMode(.large)
    }
    
}
