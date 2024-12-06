//
//  HealthyDecisionsViewModel.swift
//  SageAI
//
//  Created by Giovanna Moeller on 04/12/24.
//

import SwiftUI
import CoreLocation

class HealthyDecisionsViewModel: ObservableObject {
    @Published var foodAnalysis: FoodAnalysisResponse?
    @Published var restaurantSuggestions: [String] = []
    @Published var dailyRoutine: String = ""
    
    private let locationManager = CLLocationManager()
    private let apiBaseURL = "http://localhost:8000"
    
    @MainActor
    func analyzeFoodImage(_ image: UIImage) {
        Task {
            do {
                let analysis = try await APIClient.shared.analyzeFoodImage(image)
                self.foodAnalysis = analysis
            } catch {
                // Handle error appropriately
                print("Error analyzing food: \(error.localizedDescription)")
                // You might want to set an error state here
            }
        }
    }
    
    @MainActor
    func fetchRestaurantSuggestions() {
        guard let location = locationManager.location else { return }
        
        Task {
            do {
                let suggestions = try await APIClient.shared.getRestaurantSuggestions(
                    latitude: location.coordinate.latitude,
                    longitude: location.coordinate.longitude
                )
                self.restaurantSuggestions = suggestions.suggestions
            } catch {
                print("Error fetching restaurants: \(error.localizedDescription)")
                // Handle error appropriately
            }
        }
    }
    
    @MainActor
    func generateDailyRoutine(schedule: [String: Any]) {
        Task {
            do {
                let response = try await APIClient.shared.generateDailyRoutine(schedule: schedule)
                self.dailyRoutine = response.routine
            } catch {
                print("Error generating routine: \(error.localizedDescription)")
                // Handle error appropriately
            }
        }
    }
}

