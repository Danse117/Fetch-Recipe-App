//
//  RecipeListView.swift
//  fetch_recipe_app
//
//  Created by Adam E on 5/13/25.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject private var viewModel = RecipeListViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.recipes) { recipe in
                        RecipeCardView(recipe: recipe)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.vertical)
                
            }
            
            // Refresh function
            // User swipes up for refreshing
            .refreshable {
                await viewModel.fetchRecipes()
            }
    
            // Header
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.brown, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Text("Recipe Book!")
                        .foregroundStyle(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal, 8)
                }
            }
        }
    }
}




#Preview {
    RecipeListView()
}
