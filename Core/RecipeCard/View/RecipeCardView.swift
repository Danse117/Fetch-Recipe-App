//
//  RecipeCardView.swift
//  fetch_recipe_app
//
//  Created by Adam E on 5/13/25.
//
// Card which displays the recipe
// User clicks on recipe and expands to show larger image and the recipe
import SwiftUI
import Foundation

struct RecipeCardView: View {
    
    @StateObject var viewModel: RecipeCardViewModel
    @State private var showingFullRecipe = false
    // ImageLoader for caching/loading cached images
    @StateObject private var imageLoader: ImageLoader
    
    var cardShape: RoundedRectangle { RoundedRectangle(cornerRadius: 12) }
    
    // Init function
    init(recipe: Recipe) {
        _viewModel = StateObject(wrappedValue: RecipeCardViewModel(recipe: recipe))
        _imageLoader = StateObject(wrappedValue: ImageLoader(urlString: recipe.smallPhotoURL ?? ""))

    }
    
    var body: some View {
        // Stack holding entire card
        VStack(alignment: .leading, spacing: 12) {
            // Stack holding image, recipe name and quisine name
            HStack(spacing: 16) {
                // Small image of the recipe
                if let _ = viewModel.smallPhoto {
                    if let image = imageLoader.image {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    } else {
                        ProgressView()
                            .frame(width: 80, height: 80)
                    }
                } else {
                    // Fallback UI if image is missing
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 80, height: 80)
                        Image(systemName: "photo")
                            .foregroundColor(.gray)
                    }
                }
                // Recipe name
                VStack(alignment: .leading, spacing: 6) {
                    Text(viewModel.recipeName)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .truncationMode(.tail)
                    // Cuisine name
                    Text(viewModel.cuisineName)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
        }
        .background(Color(.brown).opacity(0.2))
        .clipShape(cardShape)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .frame(width: 380, height: 112, alignment: .leading)
        .onTapGesture {
            showingFullRecipe = true
        }
        // Sheet for FullRecipeCardView
        .sheet(isPresented: $showingFullRecipe) {
            FullRecipeCardView(recipe: viewModel.recipe)
        }
    }
}


struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(recipe: dev.recipe)
    }
}

