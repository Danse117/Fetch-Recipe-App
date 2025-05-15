//
//  RecipeListView.swift
//  fetch_recipe_app
//
//  Created by Adam E on 5/13/25.
//

import SwiftUI

struct RecipeListView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                HeaderView()
                LazyVStack() {
                    ForEach(0..<10) {_ in
                        RecipeCardView()
                    }
                }
            }
        }
    }
}

#Preview {
    RecipeListView()
}
