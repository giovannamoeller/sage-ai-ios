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
        VStack(alignment: .leading, spacing: 12) {
            NutritionCard(analysis: analysis)
            
            Text("Healthy Score: \(analysis.healthScore.total)/100")
                .font(.headline)
            
            Text("Suggestions:")
                .font(.headline)
            
            ForEach(analysis.suggestions.alternatives, id: \.self) { suggestion in
                Text("• \(suggestion)")
                    .font(.body)
            }
            
            ForEach(analysis.suggestions.modifications, id: \.self) { modification in
                Text("• \(modification)")
                    .font(.body)
            }
            
            ForEach(analysis.suggestions.complementaryFoods, id: \.self) { food in
                Text("• \(food)")
                    .font(.body)
            }
        }
        .padding()
    }
}

#Preview {
    FoodAnalysisView(analysis: exampleResponse)
}
