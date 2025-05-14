//
//  SplashScreenView.swift
//  fetch_recipe_app
//
//  Created by Adam E on 5/13/25.
//

import SwiftUI
import UIKit
struct SplashScreenView: View {
    @State var isLoading = false
    
    var body: some View {
        ZStack{
            if self.isLoading{
                RecipeListView()
            } else {
                Rectangle()
                    .fill(Color.brown)
                    .ignoresSafeArea()
                Image(systemName: "frying.pan.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                withAnimation(.easeInOut(duration: 1)){
                    isLoading = true;
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
