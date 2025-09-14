//
//  ContentView.swift
//  GitHubFollowersSwiftUI
//
//  Created by Rakesh Yadav on 13/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            FavoritesListView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
        }
        .tint(.green)
    }
}

#Preview {
    ContentView()
}
