//
//  FollowerListVC.swift
//  GitHubFollowers
//
//  Created by Rakesh Yadav on 14/09/25.
//

import UIKit

class FollowerListVC: UIViewController {
    
    enum Section {
        case main
    }
    
    var userName: String!
    var followers: [Follower] = []
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViewControllers()
        self.setupCollectionView()
        self.configureDataSource()
        self.getFollowers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configureViewControllers() {
        self.view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupCollectionView() {
        self.collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnUICollectionViewFlowLayout(in: view))
        self.view.addSubview(self.collectionView)
        self.collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseIdentifier)
    }
    
    private func createThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
        
        let width: CGFloat = self.view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth: CGFloat = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth: CGFloat = availableWidth / 3
        let itemHeight: CGFloat = itemWidth + 40
        
        let flowLayout: UICollectionViewFlowLayout = .init()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        return flowLayout
    }
    
    private func getFollowers() {
        NetworkManager.shared.getFollowers(for: self.userName, page: 1) { [weak self] result in
            
            guard let self: FollowerListVC = self else { return }
            
            switch result {
                
            case .success(let followers):
                self.followers = followers
                self.updateData()
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Request", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    private func configureDataSource() {
        self.dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: self.collectionView) { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            
            let cell: FollowerCell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseIdentifier, for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            return cell
        }
    }
    
    private func updateData() {
        var snapshot: NSDiffableDataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(self.followers)
        
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
}
