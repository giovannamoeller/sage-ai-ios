//
//  FoodAnalysisView.swift
//  SageAI
//
//  Created by Giovanna Moeller on 04/12/24.
//

import SwiftUI

struct FoodAnalysisView: View {
    let analysis: FoodAnalysisResponse
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HealthScoreCard(score: analysis.healthScore)
                
                NutritionFactsCard(nutritionalInfo: analysis.nutritionalInfo)
                
                DietaryInfoCard(dietaryInfo: analysis.dietaryInfo)
                
                SuggestionsCard(suggestions: analysis.suggestions)
            }
            .padding()
        }
    }
}

#Preview {
    FoodAnalysisView(analysis: exampleResponse)
}
