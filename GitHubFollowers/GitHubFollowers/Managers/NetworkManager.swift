//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Rakesh Yadav on 20/09/25.
//

import Foundation

class NetworkManager {
    
    static let shared: NetworkManager = NetworkManager()
    let baseUrl: String = "https://api.github.com/users/"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completion: @escaping ([Follower]?, ErrorMessage?) -> Void) {
        
        let endPoint: String = "\(baseUrl)\(username)/followers?per_page=100&page=\(page)"
        
        guard let url: URL = URL(string: endPoint) else {
            completion(nil, .invalidUserName)
            return
        }
        
        let task: URLSessionDataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completion(nil, .unableToCompleteRequest)
            }
            
            guard let response: HTTPURLResponse = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, .invalidResponse)
                return
            }
            
            guard let data: Data = data else {
                completion(nil, .invalideData)
                return
            }
            
            do {
                let jsonDecoder: JSONDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers: [Follower] = try jsonDecoder.decode([Follower].self, from: data)
                completion(followers, nil)
                
            } catch {
                completion(nil, .invalideData)
            }
        }
        
        task.resume()
    }
}
