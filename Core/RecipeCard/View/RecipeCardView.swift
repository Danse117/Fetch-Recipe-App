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
    // let recipe: Recipe
    // @StateObject var viewModel = RecipeCardViewModel()
    var cardShape: RoundedRectangle { RoundedRectangle(cornerRadius: 20) }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            HStack{
                Image(systemName: "frying.pan.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("Recipe Name")
            }
            
            Text("Recipe Photo")
            Text("Quisine Type")
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
        .containerShape(cardShape)
        
        
    }
}

/*
struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView()
    }
}
*/
#Preview {
    RecipeCardView()
}
