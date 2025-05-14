//
//  TabBarView.swift
//  fetch_recipe_app
//
//  Created by Adam E on 5/13/25.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTabIndex: Int = 0

    var body: some View {
        TabView(selection: $selectedTabIndex){
            
        }
        .foregroundStyle(Color.brown)
    }
}

#Preview {
    TabBarView()
}
