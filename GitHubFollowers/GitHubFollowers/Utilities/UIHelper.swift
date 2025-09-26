//
//  UIHelper.swift
//  GitHubFollowers
//
//  Created by Rakesh Yadav on 26/09/25.
//

import UIKit

struct UIHelper {
    
    static func createThreeColumnUICollectionViewFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width: CGFloat = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpecing: CGFloat = 10
        let numberOfColumn: CGFloat = 3.0
        let availableWidth: CGFloat = width - (padding * 2) - (minimumItemSpecing * 2)
        let itemWidth: CGFloat = availableWidth / numberOfColumn
        
        let flowLayout: UICollectionViewFlowLayout = .init()
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
}
