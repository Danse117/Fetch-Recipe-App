import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(){
                    Text("App was made for Fetch coding challenge")
                    Text("Version 1.0").bold()
                }
                .padding(20)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.brown, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Text("Settings")
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal, 8)
            }
            
        }
    }
    
}

#Preview {
    SettingsView()
} 
