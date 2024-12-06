//
//  HomeView.swift
//  SageAI
//
//  Created by Giovanna Moeller on 04/12/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            NavigationStack {
                UploadFoodView()
            }
            .tabItem {
                Label("Analyze", systemImage: "camera")
            }
            NavigationStack {
                RestaurantSuggestionsView()
            }
            .tabItem {
                Label("Restaurants", systemImage: "map")
            }
            
            NavigationStack {
                DailyRoutineView()
            }
            .tabItem {
                Label("Routine", systemImage: "calendar")
            }
        }
    }
}



#Preview {
    HomeView()
}
