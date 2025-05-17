//
//  Recipe.swift
//  fetch_recipe_app
//
//  Created by Adam E on 5/13/25.
//

import Foundation


struct Recipe: Codable, Identifiable {
    // id for the
    var id: String { uuid }
    
    // Params taken from JSON
    var recipeName: String
    var cuisineName: String
    let largePhotoURL: String
    let smallPhotoURL: String
    var uuid: String
    var sourceURL: String
    var youtubeURL: String?
    
    // Default initializer
    init(recipeName: String, cuisineName: String, largePhotoURL: String, smallPhotoURL: String, uuid: String, sourceURL: String, youtubeURL: String?) {
        self.recipeName = recipeName
        self.cuisineName = cuisineName
        self.largePhotoURL = largePhotoURL
        self.smallPhotoURL = smallPhotoURL
        self.uuid = uuid
        self.sourceURL = sourceURL
        self.youtubeURL = youtubeURL
    }
    
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
    
    // Accounting for empty || malformed data
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.recipeName = try container.decodeIfPresent(String.self, forKey: .recipeName) ?? "Unknown Recipe"
        self.cuisineName = try container.decodeIfPresent(String.self, forKey: .cuisineName) ?? "Unknown Cuisine"
        self.largePhotoURL = try container.decodeIfPresent(String.self, forKey: .largePhotoURL) ?? ""
        self.smallPhotoURL = try container.decodeIfPresent(String.self, forKey: .smallPhotoURL) ?? ""
        self.uuid = try container.decodeIfPresent(String.self, forKey: .uuid) ?? UUID().uuidString
        self.sourceURL = try container.decodeIfPresent(String.self, forKey: .sourceURL) ?? ""
        self.youtubeURL = try container.decodeIfPresent(String?.self, forKey: .youtubeURL) ?? nil
    }
}
