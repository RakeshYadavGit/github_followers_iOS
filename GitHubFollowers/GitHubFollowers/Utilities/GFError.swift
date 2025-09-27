//
//  GFError.swift
//  GitHubFollowers
//
//  Created by Rakesh Yadav on 20/09/25.
//

enum GFError: String, Error {
    case invalidUserName         = "This username created a invalid request. Please try again with a different username."
    case unableToCompleteRequest = "Unable to complete your request. Please check your internet connection."
    case invalidResponse         = "Invalid response from sever. Please try again."
    case invalideData            = "Invalid data received from server. Please try again."
    
}
