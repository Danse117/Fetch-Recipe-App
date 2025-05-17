//
//  RecipeService.swift
//  fetch_recipe_app
//
//  Created by Adam E on 5/15/25.
//

import Foundation


class RecipeService {
    func fetchRecipes() async throws -> [Recipe] {
        // Get the JSON as a URL
        guard let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json") else {
            throw URLError(.badURL)
        }
        
        // Load the data
        let (data, _) = try await URLSession.shared.data(from: url)
        // Decode the JSON into Recipe Model
        let response = try JSONDecoder().decode(RecipeResponse.self, from: data)
        return response.recipes
    }
}

// Response structure to match the JSON
struct RecipeResponse: Codable {
    let recipes: [Recipe]
}
