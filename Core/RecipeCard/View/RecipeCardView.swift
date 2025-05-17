//
//  RecipeCardView.swift
//  fetch_recipe_app
//
//  Created by Adam E on 5/13/25.
//
// Card which displays the recipe
// User clicks on recipe and expands to show larger image and the recpie
import SwiftUI

struct RecipeCardView: View {
    @StateObject var viewModel: RecipeCardViewModel
    var cardShape: RoundedRectangle { RoundedRectangle(cornerRadius: 12) }
    
    init(recipe: Recipe) {
        _viewModel = StateObject(wrappedValue: RecipeCardViewModel(recipe: recipe))
    }
    
    var body: some View {
        // Stack holding entire card
        VStack(alignment: .leading, spacing: 12) {
            // Stack holding image, recipe name and quisine name
            
            HStack(spacing: 16) {
                
                // Small image of the recipe
                if let imageURL = viewModel.smallPhoto {
                    AsyncImage(url: imageURL) {
                        image in image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    } placeholder: {
                        ProgressView()
                            .frame(width: 80, height: 80)
                    }
                }
                
                // Name and cuisine name of the recipe
                VStack(alignment: .leading, spacing: 6) {
                    Text(viewModel.recipeName)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .truncationMode(.tail)
                    
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
    }
        
}
    




struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(recipe: dev.recipe)
    }
}

