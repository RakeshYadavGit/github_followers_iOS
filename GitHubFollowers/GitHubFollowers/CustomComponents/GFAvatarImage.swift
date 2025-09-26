//
//  GFAvatarImage.swift
//  GitHubFollowers
//
//  Created by Rakesh Yadav on 22/09/25.
//

import UIKit

class GFAvatarImage: UIImageView {
    
    let cache: NSCache = NetworkManager.shared.cache
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder?) {
        fatalError( "init(coder:) has not been implemented" )
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10
        self.clipsToBounds      = true
        self.image              = UIImage(named: "avatar-placeholder")!
        
        
    }
    
    func downloadAvatarImage(avatarUrl: String) {
        NetworkManager.shared.getAvatarImage(url: avatarUrl) { [weak self] result in
            
            guard let self = self else { return }
            
            let cacheKey: NSString = NSString(string: avatarUrl)
            
            if let image: UIImage = self.cache.object(forKey: cacheKey) {
                DispatchQueue.main.async {
                    self.image = image
                }
                
                return
            }
            
            switch result {
            case .success(let data):
                
                guard let image: UIImage = UIImage(data: data) else { return }
                
                self.cache.setObject( image,forKey: cacheKey)
                
                DispatchQueue.main.async {
                    self.image = image
                }
                
            case .failure(_):
                return
            }
        }
    }
}
