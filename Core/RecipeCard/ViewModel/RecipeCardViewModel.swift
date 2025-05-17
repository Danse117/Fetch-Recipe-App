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
    
    var largePhoto: URL? {
        URL(string: recipe.largePhotoURL)
    }
    
    var smallPhoto: URL? {
        URL(string: recipe.smallPhotoURL)
    }
    
    var sourceURL: URL? {
        URL(string: recipe.sourceURL)
    }
    
    var youtubeURL: URL? {
        guard let youtubeURL = recipe.youtubeURL else { return nil }
        return URL(string: youtubeURL)
    }
}
