//
//  FullRecipeCardView.swift
//  fetch_recipe_app
//
//  Created by Adam E on 5/16/25.
//

import SwiftUI

struct FullRecipeCardView: View {
    var body: some View {
        NavigationView{
            VStack{
                
                Text("Recipe Name")
                Text("Cusine Name")
                Text("Large Image URL")
                Text("Source URL")
                Text("YouTube URL")
            }
        }.navigationTitle("Recipe Name")
        .navigationBarTitleDisplayMode(.inline)
        toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                
            }
        }
    }
}

#Preview {
    FullRecipeCardView()
}
