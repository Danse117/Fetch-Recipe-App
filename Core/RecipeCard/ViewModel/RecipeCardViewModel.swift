//
//  RecipeCardViewModel.swift
//  fetch_recipe_app
//
//  Created by Adam E on 5/13/25.
//

import Foundation
import SwiftUI

final class RecipeCardViewModel: ObservableObject {
    @Published var recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var recipeName: String {
        recipe.recipeName
    }
    
    var cuisineName: String {
        recipe.cuisineName
    }
    
    // Below are the optional fields that might not appear
    var smallPhoto: URL? {
        guard let urlString = recipe.smallPhotoURL else { return nil }
        return URL(string: urlString)
    }

    var largePhoto: URL? {
        guard let urlString = recipe.largePhotoURL else { return nil }
        return URL(string: urlString)
    }
    
    var sourceURL: URL? {
        guard let raw = recipe.sourceURL else { return nil }
        return URL(string: raw)
    }
    
    var youtubeURL: URL? {
        guard let youtubeURL = recipe.youtubeURL else { return nil }
        return URL(string: youtubeURL)
    }
}
