//
//  HeaderView.swift
//  fetch_recipe_app
//
//  Created by Adam E on 5/13/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack{
            Spacer()
            Text("Recipie Book!")
            .foregroundStyle(.white)
            .font(.title)
            .fontWeight(.bold)
            Spacer()
        }.padding(.vertical)
        .background(Color.brown)
        .ignoresSafeArea(.all)
    
        
        
    }
}

#Preview {
    HeaderView()
}
