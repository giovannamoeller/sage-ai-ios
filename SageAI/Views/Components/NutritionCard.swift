//
//  NutritionCard.swift
//  SageAI
//
//  Created by Giovanna Moeller on 04/12/24.
//

import SwiftUI

struct NutritionCard: View {
    let analysis: FoodAnalysisResponse
    
    var body: some View {
        VStack {
            HStack {
                NutritionItem(label: "Calories", value: "\(analysis.nutritionalInfo.calories)")
                NutritionItem(label: "Protein", value: "\(analysis.nutritionalInfo.protein)g")
                NutritionItem(label: "Carbs", value: "\(analysis.nutritionalInfo.carbs.total)g")
                NutritionItem(label: "Fat", value: "\(analysis.nutritionalInfo.fat.total)g")
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}

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

#Preview {
    NutritionCard(analysis: exampleResponse)
}
