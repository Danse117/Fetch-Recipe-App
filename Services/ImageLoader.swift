//
//  ImageLoader.swift
//  fetch_recipe_app
//
//  Created by Adam E on 5/17/25.
//

import Foundation
import SwiftUI

// Class that loads an image from disk cache or network
// publishes the loaded UIImage to be used in SwiftUI views
@MainActor
class ImageLoader: ObservableObject {
    
    // Published image used by the UI
    @Published var image: UIImage? = nil
    
    // The URL of the image to load
    private var imageURL: URL?

    // Initializes the loader with a URL string
    init(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        self.imageURL = url
        loadImage(from: url)
    }

    // Attempts to load the image from disk, or downloads and caches it
    private func loadImage(from url: URL) {
        // Check if image is already cached on disk
        if let cached = ImageCacheManager.shared.loadImageFromDisk(for: url) {
            self.image = cached
            return
        }

        // Download and cache the image if not already available
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let loadedImage = UIImage(data: data) {
                    ImageCacheManager.shared.saveImageToDisk(data, for: url)
                    self.image = loadedImage
                }
            } catch {
                print("Image loading failed for URL: \(url)")
            }
        }
    }
}
