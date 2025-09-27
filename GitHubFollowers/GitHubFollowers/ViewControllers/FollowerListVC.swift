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
    var filterFollowers: [Follower] = []
    
    var page: Int = 1
    var hashMoreFollower: Bool = true
    var isSearching: Bool = false
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViewControllers()
        self.configureSearchController()
        self.setupCollectionView()
        self.configureDataSource()
        self.getFollowers(page: 1)
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
        self.collectionView.delegate = self
    }
    
    private func getFollowers(page: Int) {
        self.showLoadView()
        NetworkManager.shared.getFollowers(for: self.userName, page: page) { [weak self] result in

            guard let self: FollowerListVC = self else { return }
            
            self.dismissLoadingView()
            
            switch result {
                
            case .success(let followers):
                if followers.count < 100 {
                    self.hashMoreFollower = false
                }
                self.followers.append(contentsOf: followers)
                
                if self.followers.isEmpty {
                    let message: String = "This user does not have any followers. Go follow them 😀."
                    DispatchQueue.main.async { self.showEmptyStateView(with: message, in: self.view) }
                    return
                }
                
                self.updateData(on: self.followers)
                
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
    
    private func updateData(on followers: [Follower]) {
        var snapshot: NSDiffableDataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    private func configureSearchController() {
        let searchController: UISearchController = .init()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search for a username..."
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false

    }
}


extension FollowerListVC: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY: CGFloat = scrollView.contentOffset.y
        let conentHeight: CGFloat = scrollView.contentSize.height
        let height: CGFloat = scrollView.frame.size.height
        
        if offsetY > conentHeight - height {
            guard self.hashMoreFollower else { return }
            self.page += 1
            self.getFollowers(page: self.page)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let followers: [Follower] = self.isSearching ? self.filterFollowers : self.followers
        let follower: Follower = followers[indexPath.item]
        
        let destVC: UserInfoVC = .init()
        destVC.userName = follower.login
        
        let navigationController: UINavigationController = .init(rootViewController: destVC)
        
        self.present(navigationController, animated: true)
    }
}

extension FollowerListVC: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter: String = searchController.searchBar.text, !filter.isEmpty else { return }
        
        self.isSearching.toggle()
        self.filterFollowers = self.followers.filter({$0.login.lowercased().contains(filter.lowercased())})
        self.updateData(on: self.filterFollowers)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.isSearching.toggle()
        self.updateData(on: self.followers)
    }
    
}
