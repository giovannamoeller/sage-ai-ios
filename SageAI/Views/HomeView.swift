//
//  HomeView.swift
//  SageAI
//
//  Created by Giovanna Moeller on 04/12/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HealthyDecisionsViewModel()
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var isLoading = false
    @State private var loadingMessage = "Just a second. We're analyzing your food..."
    @State private var errorAlert: ErrorAlert?
    
    private func analyzeFood(_ image: UIImage) {
        isLoading = true
        
        Task {
            do {
                let analysis = try await APIClient.shared.analyzeFoodImage(image)
                await MainActor.run {
                    viewModel.foodAnalysis = analysis
                    isLoading = false
                }
            } catch(let error as NetworkError) {
                await MainActor.run {
                    isLoading = false
                    errorAlert = .basic(
                        message: "Failed to analyze food: \(error.localizedDescription)",
                        buttonTitle: "Try Again"
                    )
                }
            }
        }
    }
    
    var body: some View {
        TabView {
            NavigationStack {
                ZStack {
                    VStack {
                        ScrollView(showsIndicators: false) {
                            VStack {
                                if let image = selectedImage {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .padding(.top)
                                        //.shadow(color: .black.opacity(0.15), radius: 15, x: 0, y: 20)
                                    
                                    if let analysis = viewModel.foodAnalysis {
                                        FoodAnalysisView(analysis: analysis)
                                    }
                                }
                            }
                            
                            Button(action: {
                                isShowingImagePicker = true
                            }) {
                                Text("Upload a picture")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: 182)
                                    .padding(12)
                                    .background(Color.accentColor)
                                    .cornerRadius(32)
                            }
                            .padding(.bottom, 20) // Add some padding from bottom
                        }
                    }
                    
                    if isLoading {
                        LoadingOverlay(message: loadingMessage)
                    }
                }
                .navigationTitle("Food Analysis")
                .sheet(isPresented: $isShowingImagePicker) {
                    ImagePicker(image: $selectedImage) { image in
                        analyzeFood(image)
                    }
                }
                .alert(item: $errorAlert) { alert in
                    if let secondaryButton = alert.secondaryButton {
                        Alert(
                            title: Text(alert.title),
                            message: Text(alert.message),
                            primaryButton: alert.primaryButton,
                            secondaryButton: secondaryButton
                        )
                    } else {
                        Alert(
                            title: Text(alert.title),
                            message: Text(alert.message),
                            dismissButton: alert.primaryButton
                        )
                    }
                }
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
