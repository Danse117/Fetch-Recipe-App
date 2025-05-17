//
//  PreviewProvider.swift
//  fetch_recipe_app
//
//  Created by Adam E on 5/13/25.
//

import Foundation
import SwiftUI


extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview{
    static let shared: DeveloperPreview = DeveloperPreview()
    let recipe = Recipe(
        recipeName: "Mashi",
        cuisineName: "Egyptian",
        largePhotoURL: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
        smallPhotoURL: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
        uuid: "",
        sourceURL: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
        youtubeURL: "https://www.youtube.com/watch?v=6R8ffRRJcrg",
    )
}
