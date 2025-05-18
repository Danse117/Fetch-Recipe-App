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
    @Published var recipes: [Recipe] = []   // The filtered list
    @Published var allRecipes: [Recipe] = []    // The original list
    @Published var isLoading: Bool = false
    @Published var error: Error?
    @Published var selectedCuisine: String?
    private let recipeService = RecipeService()
    @Published var alertItem: AlertItem? = nil
    
    // For propogating the list of cuisines in the filter menu
    var uniqueCuisines: [String] {
        Array(Set(allRecipes.map { $0.cuisineName })).sorted()
    }
    
    // init the list
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
            allRecipes = fetchedRecipes // triggers UI update
            recipes = fetchedRecipes
            
            // If there are no recipies to be found
            if recipes.isEmpty {
                alertItem = AlertItem(title: "No Recipes", message: "No recipes found. Please try again later.")
            }
            
            // Catch for when data is malformed
        } catch let decodingError as DecodingError {
            self.error = decodingError
            alertItem = AlertItem(title: "Malformed Data", message: "The recipe data is malformed and cannot be displayed.")
            recipes = []
            allRecipes = []
            
        // Catch network error
        } catch {
            self.error = error
            alertItem = AlertItem(title: "Fetch Failed", message: "An unexpected error occurred while fetching the recipes.")
            recipes = []
            allRecipes = []
        }
        
        isLoading = false
    }
    
    // Refreshing the recipe list
    func refreshRecipes() async {
        await fetchRecipes()
    }
    
    // Applying a filter to the list
    func applyFilter(cuisine: String?) {
        selectedCuisine = cuisine
        
        if let cuisine = cuisine, !cuisine.isEmpty {
            recipes = allRecipes.filter { recipe in
                recipe.cuisineName.lowercased() == cuisine.lowercased()
            }
        } else {
            recipes = allRecipes
        }
    }
}

// Struct for displaying alerts
struct AlertItem: Identifiable {
    var id = UUID()
    let title: String
    let message: String
}
