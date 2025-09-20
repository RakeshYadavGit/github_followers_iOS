//
//  User.swift
//  GitHubFollowers
//
//  Created by Rakesh Yadav on 20/09/25.
//

struct User: Codable {
    let login: String
    let avatarUrl: String
    let name: String?
    let location: String?
    let bio: String?
    
}
