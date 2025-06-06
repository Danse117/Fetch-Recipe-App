//
//  TabBarView.swift
//  fetch_recipe_app
//
//  Created by Adam E on 5/13/25.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTabIndex: Int = 0

    var body: some View {
        TabView(selection: $selectedTabIndex) {
            // Recipe List View
            NavigationStack {
                RecipeListView()
            }
            .tabItem {
                Label("Recipes", systemImage: "fork.knife")
            }
            .tag(0)
            
            // Settings view
            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gear")
            }
            .tag(1)
        }
        .tint(.brown)
    }
}

#Preview {
    TabBarView()
}
