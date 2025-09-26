//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Rakesh Yadav on 20/09/25.
//

import UIKit

class NetworkManager {
    
    static let shared: NetworkManager = NetworkManager()
    
    private let baseUrl: String = "https://api.github.com/users/"
    let cache: NSCache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completion: @escaping (Result<[Follower], GFError>) -> Void) {
        
        let endPoint: String = "\(baseUrl)\(username)/followers?per_page=100&page=\(page)"
        
        guard let url: URL = URL(string: endPoint) else {
            completion(.failure(.invalidUserName))
            return
        }
        
        let task: URLSessionDataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completion(.failure(.unableToCompleteRequest))
            }
            
            guard let response: HTTPURLResponse = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data: Data = data else {
                completion(.failure(.invalideData))
                return
            }
            
            do {
                let jsonDecoder: JSONDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers: [Follower] = try jsonDecoder.decode([Follower].self, from: data)
                completion(.success(followers))
                
            } catch {
                completion(.failure(.invalideData))
            }
        }
        
        task.resume()
    }
    
    func getAvatarImage(url: String, completion: @escaping (Result<Data, GFError>) -> Void) {
        
        guard let url: URL = URL(string: url) else {
            completion(.failure(.unableToCompleteRequest))
            return
        }
        
        let task: URLSessionDataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completion(.failure(.unableToCompleteRequest))
            }
            
            guard let response: HTTPURLResponse = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.unableToCompleteRequest))
                return
            }
            
            guard let data: Data = data else {
                completion(.failure(.invalideData))
                return
            }
            
            completion(.success(data))
            
        }
        
        task.resume()
    }
}
