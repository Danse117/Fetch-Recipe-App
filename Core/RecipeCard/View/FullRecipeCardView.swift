//
//  FullRecipeCardView.swift
//  fetch_recipe_app
//
//  Created by Adam E on 5/16/25.
//

import SwiftUI
import Foundation

struct FullRecipeCardView: View {
    
    @Environment(\.dismiss) private var dismiss
    // ImageLoader for caching/loading cached images
    @StateObject private var imageLoader: ImageLoader
    let recipe: Recipe
    
    // Init function
    init(recipe: Recipe) {
        self.recipe = recipe
        _imageLoader = StateObject(wrappedValue: ImageLoader(urlString: recipe.largePhotoURL ?? ""))
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Large recipe Photo
                    ZStack(alignment: .topTrailing) {
                        if recipe.largePhotoURL != nil {
                            if let uiImage = imageLoader.image {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 300)
                                    .clipped()
                            } else {
                                ProgressView()
                                    .frame(height: 300)
                            }
                        } else {
                            // Fall back image
                            ZStack {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.1))
                                    .frame(height: 300)
                                Image(systemName: "photo")
                                    .font(.largeTitle)
                                    .foregroundColor(.gray)
                            }
                        }
                        // Button to dismiss the sheet
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "x.circle.fill")
                                .font(.title)
                                .foregroundColor(.white)
                                .shadow(radius: 2)
                        }
                        .padding()
                    }
                    
                    // Recipe name, cuisine name, sourcleURL, and YouTube URL
                    VStack(alignment: .leading, spacing: 16) {
                        // Recipe Name
                        Text(recipe.recipeName)
                            .font(.title)
                            .fontWeight(.bold)
                        // Cuisine name
                        Text(recipe.cuisineName)
                            .font(.title3)
                            .foregroundColor(.secondary)
                        // SourceURL
                        if let source = recipe.sourceURL, let url = URL(string: source) {
                            Link("View Original Recipe", destination: url)
                                .font(.title2)
                        }
                        // YouTube
                        if let youtubeURL = recipe.youtubeURL,
                           let url = URL(string: youtubeURL) {
                            Link("Watch on YouTube", destination: url)
                                .font(.title2)
                        }
                    }
                    .padding()
                }
            }
        }
        // Recipe name
        .navigationTitle(recipe.recipeName)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                
            }
        }
    }
}

struct FullRecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        FullRecipeCardView(recipe: dev.recipe)
    }
}
