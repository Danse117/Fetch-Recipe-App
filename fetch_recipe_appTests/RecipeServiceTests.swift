//
//  RecipeServiceTests.swift
//  fetch_recipe_appTests
//
//  Created by Adam E on 5/17/25.
//

import Foundation
import XCTest
@testable import fetch_recipe_app

final class RecipeServiceTests: XCTestCase {
    
    // Tests if RecipeService can fetch and decode the recipes
    func testSuccessfulFetch() async throws {
        let service = RecipeService()

        do {
            let recipes = try await service.fetchRecipes()
            XCTAssertFalse(recipes.isEmpty, "Recipes should not be empty")
        } catch {
            XCTFail("Expected successful fetch, but got error: \(error)")
        }
    }

    // Tests if the decoding logic fails, as expected
    // Gives badJSON file which is not in the right format as [Recipe]
    func testMalformedJSONThrows() async {
        let badJSON = """
        { "invalid": "data" }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        do {
            _ = try decoder.decode([Recipe].self, from: badJSON)
            XCTFail("Expected decoding to fail with malformed JSON")
        } catch {
            
        }
    }
}
