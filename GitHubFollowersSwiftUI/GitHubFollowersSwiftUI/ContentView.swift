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
            NavigationStack {
                SearchView()
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            .navigationTitle("Search")
            
            NavigationStack {
                FavoritesListView()
            }
            .tabItem {
                Label("Favorites", systemImage: "star")
            }
            .navigationTitle("Favorites")
            
        }
        .tint(.green)
    }
}

#Preview {
    ContentView()
}
