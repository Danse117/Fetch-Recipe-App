//
//  Recipe.swift
//  fetch_recipe_app
//
//  Created by Adam E on 5/13/25.
//

import Foundation


struct Recipe: Codable, Identifiable {
    // id 
    var id: String { uuid }
    
    // Params taken from JSON
    let recipeName: String
    let cuisineName: String
    let largePhotoURL: String?
    let smallPhotoURL: String?
    let uuid: String
    let sourceURL: String?
    let youtubeURL: String?
    
    // For mapping parms of Recipe to the JSON params from the API Call
    enum CodingKeys: String, CodingKey {
        case recipeName = "name"
        case cuisineName = "cuisine"
        case largePhotoURL = "photo_url_large"
        case smallPhotoURL = "photo_url_small"
        case uuid = "uuid"
        case sourceURL = "source_url"
        case youtubeURL = "youtube_url"
    }
    
}
