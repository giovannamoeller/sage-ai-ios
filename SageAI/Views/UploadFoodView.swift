//
//  UploadFoodView.swift
//  SageAI
//
//  Created by Giovanna Moeller on 06/12/24.
//

import SwiftUI

struct UploadFoodView: View {
    
    @StateObject private var viewModel = HealthyDecisionsViewModel()
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var isLoading = false
    @State private var loadingMessage = "Just a second. We're analyzing your food..."
    @State private var showError = false
    @State private var errorMessage = ""
    
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
                    errorMessage = "Failed to analyze food: \(error.localizedDescription)"
                    showError = true
                }
            }
        }
    }
    
    var body: some View {
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
            
            if showError {
                CustomAlert(
                    message: errorMessage,
                    primaryAction: {
                        if let image = selectedImage {
                            analyzeFood(image)
                        }
                    },
                    isPresented: $showError
                )
            }
        }
        .navigationTitle("Food Analysis")
        .sheet(isPresented: $isShowingImagePicker) {
            ImagePicker(image: $selectedImage) { image in
                analyzeFood(image)
            }
        }
    }
}

#Preview {
    UploadFoodView()
}
