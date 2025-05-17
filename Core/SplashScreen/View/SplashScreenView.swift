//
//  SplashScreenView.swift
//  fetch_recipe_app
//
//  Created by Adam E on 5/13/25.
//

import SwiftUI
struct SplashScreenView: View {
    @State var isLoading = false
    
    var body: some View {
        ZStack {
            if self.isLoading {
                RecipeListView()
                    .transition(.opacity)
            } else {
                Rectangle()
                    .fill(Color.brown)
                    .ignoresSafeArea()
                VStack {
                    Image(systemName: "frying.pan.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                    
                    Text("Fetch Recipe Book")
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding()
                }
                .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 1.0), value: isLoading)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                isLoading = true
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
