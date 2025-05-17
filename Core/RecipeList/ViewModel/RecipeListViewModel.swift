//
//  RecipeListViewModel.swift
//  fetch_recipe_app
//
//  Created by Adam E on 5/15/25.
//

import Foundation
import SwiftUI

@MainActor
final class RecipeListViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?

    private let recipeService = RecipeService()

    // init
    init() {
        Task {
            await fetchRecipes()
        }
    }
    
    // Fetch the recipes
    func fetchRecipes() async {
        isLoading = true
        error = nil
        
        do {
            let fetchedRecipes = try await recipeService.fetchRecipes()
            recipes = fetchedRecipes // triggers UI update
        } catch {
            self.error = error
            print("Failed to fetch recipes:", error)
        }

        isLoading = false
    }
    
    // Refreshing the recipe list
    func refreshRecipes() async {
        await fetchRecipes()
    }
}
