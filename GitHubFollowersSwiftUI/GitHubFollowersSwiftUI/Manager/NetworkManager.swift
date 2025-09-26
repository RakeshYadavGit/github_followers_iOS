//
//  NetworkManager.swift
//  GitHubFollowersSwiftUI
//
//  Created by Rakesh Yadav on 24/09/25.
//

import Foundation

class NetworkManager {
    
    static let shared: NetworkManager = .init()
    
    private let baseUrl: String = "https://api.github.com/users/"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completion: @escaping (Result<[Follower], GFError>) -> Void) {
        
        let endPoint: String = "\(baseUrl)\(username)/followers?per_page=100&page=\(page)"
        
        guard let url: URL = URL(string: endPoint) else {
            completion(.failure(.invalidUsername))
            return
        }
        
        let task: URLSessionTask =  URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completion(.failure(.unableToComplete))
            }
            
            if let response: HTTPURLResponse = response as? HTTPURLResponse, response.statusCode != 200 {
                completion(.failure(.invalidResponse))
            }
            
            guard let data: Data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                
                let jsonDecoder: JSONDecoder = .init()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers: [Follower] = try jsonDecoder.decode([Follower].self, from: data)
                completion(.success(followers))
                
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
}
