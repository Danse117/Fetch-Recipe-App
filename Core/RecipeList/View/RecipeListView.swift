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
                // Entire list of fetched recipes
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.recipes) { recipe in
                        RecipeCardView(recipe: recipe)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.vertical)

                // Display alert
                .alert(item: $viewModel.alertItem) { item in
                    Alert(
                    title: Text(item.title),
                    message: Text(item.message),
                    dismissButton: .default(Text("OK"))
                    )
                }
                

            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.brown, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                // Header
                ToolbarItem(placement: .navigation) {
                    Text("Recipe Book!")
                        .foregroundStyle(.white)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal, 8)
                }
                // Filtering button
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button("All Cuisines") {
                            viewModel.applyFilter(cuisine: nil)
                        }
                        ForEach(viewModel.uniqueCuisines, id: \.self) { cuisine in
                            Button(cuisine) {
                                viewModel.applyFilter(cuisine: cuisine)
                            }
                        }
                    } label: {
                        Image(systemName: "line.horizontal.3.decrease.circle.fill")
                            .foregroundStyle(.white)
                    }
                }
            }
        }
        // User swipes up to refresh page
        .refreshable {
            await viewModel.fetchRecipes()
        }
    }
}



#Preview {
    RecipeListView()
}
