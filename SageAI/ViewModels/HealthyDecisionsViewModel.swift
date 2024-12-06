//
//  HealthyDecisionsViewModel.swift
//  SageAI
//
//  Created by Giovanna Moeller on 04/12/24.
//

import SwiftUI
import CoreLocation

let exampleResponse = FoodAnalysisResponse(
    nutritionalInfo: NutritionalInfo(
        calories: 450,
        protein: 25.5,
        carbs: CarbBreakdown(
            total: 48.0,
            simple: 12.0,
            complex: 36.0
        ),
        fat: FatBreakdown(
            total: 15.0,
            saturated: 3.5,
            unsaturated: 11.5
        ),
        fiber: 8.5,
        keyNutrients: ["Vitamin B12", "Iron", "Omega-3", "Potassium"]
    ),
    healthScore: HealthScore(
        total: 85,
        breakdown: ScoreBreakdown(
            nutritionalBalance: 88,
            portionSize: 85,
            wholeFoods: 90,
            nutrientDensity: 82
        )
    ),
    dietaryInfo: DietaryInfo(
        allergens: ["None detected"],
        suitableDiets: ["Keto", "Mediterranean", "Low-carb"],
        glycemicLoad: "Low"
    ),
    suggestions: Suggestions(
        alternatives: [
            "Replace white rice with quinoa for more protein",
            "Add avocado for healthy fats",
            "Include more leafy greens for extra nutrients"
        ],
        modifications: [
            "Reduce portion size by 15%",
            "Add more vegetables for volume"
        ],
        complementaryFoods: [
            "Green salad",
            "Steamed vegetables",
            "Greek yogurt"
        ]
    ),
    portionAnalysis: PortionAnalysis(
        isAppropriate: true,
        idealPortion: "Current portion is appropriate for lunch",
        caloricDensity: "Moderate"
    )
)

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

