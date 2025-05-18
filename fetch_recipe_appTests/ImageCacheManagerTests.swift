//
//  ImageCacheManagerTests.swift
//  fetch_recipe_appTests
//
//  Created by Adam E on 5/17/25.
//

import XCTest
@testable import fetch_recipe_app
import UIKit

final class ImageCacheManagerTests: XCTestCase {
    
    // Test sees if ImageCacheManager saves image to disk
    // Test sees if ImageCacheManager can retrieve the saved image
    func testSaveAndLoadImage() {
        let manager = ImageCacheManager.shared
        let url = URL(string: "https://test.com/image.jpg")!
        let image = UIImage(systemName: "photo")!
        let data = image.pngData()!
        
        // Save and load to and from disk
        manager.saveImageToDisk(data, for: url)
        let loadedImage = manager.loadImageFromDisk(for: url)
        
        XCTAssertNotNil(loadedImage, "Image should be loaded from disk")
    }

    // Checks if image that was never cached returns nil, by using a fakeURL
    func testLoadNonexistentImageReturnsNil() {
        let manager = ImageCacheManager.shared
        let fakeURL = URL(string: "https://doesnotexist.com/image.jpg")!
        let result = manager.loadImageFromDisk(for: fakeURL)
        XCTAssertNil(result, "Should return nil for nonexistent image")
    }
}
