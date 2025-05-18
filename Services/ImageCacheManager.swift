//
//  ImageCacheManager.swift
//  fetch_recipe_app
//
//  Created by Adam E on 5/17/25.
//

import Foundation
import UIKit

// A singleton that manages manual disk caching of images.
final class ImageCacheManager {
    
    static let shared = ImageCacheManager()
    // Directory where cached images are stored
    private let cacheDirectory: URL

    private init() {
        // Use the system provided "Caches" directory
        cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
    }

    // Generates a filename for a given image URL
    private func filename(for url: URL) -> String {
        return url.absoluteString.addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? UUID().uuidString
    }

    // Saves image data to disk using a unique filename based on its URL
    func saveImageToDisk(_ imageData: Data, for url: URL) {
        let fileURL = cacheDirectory.appendingPathComponent(filename(for: url))
        try? imageData.write(to: fileURL)
    }

    // Attempts to load a previously cached image from disk
    func loadImageFromDisk(for url: URL) -> UIImage? {
        let fileURL = cacheDirectory.appendingPathComponent(filename(for: url))
        guard FileManager.default.fileExists(atPath: fileURL.path) else { return nil }
        guard let data = try? Data(contentsOf: fileURL) else { return nil }
        return UIImage(data: data)
    }
}
