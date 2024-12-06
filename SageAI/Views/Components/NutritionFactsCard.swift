//
//  NutritionFactsCard.swift
//  SageAI
//
//  Created by Giovanna Moeller on 06/12/24.
//

import SwiftUI

struct NutritionFactsCard: View {
    let nutritionalInfo: NutritionalInfo
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text("Nutrition Facts")
                    .font(.headline)
                Spacer()
                Image(systemName: "leaf.fill")
                    .foregroundColor(.green)
            }
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 16) {
                NutrientItem(label: "Calories", value: "\(nutritionalInfo.calories)")
                NutrientItem(label: "Protein", value: "\(nutritionalInfo.protein)g")
                NutrientItem(label: "Total Carbs", value: "\(nutritionalInfo.carbs.total)g")
                NutrientItem(label: "Total Fat", value: "\(nutritionalInfo.fat.total)g")
                NutrientItem(label: "Fiber", value: "\(nutritionalInfo.fiber)g")
            }
            
            if !nutritionalInfo.keyNutrients.isEmpty {
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Key Nutrients")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    FlowLayout(mode: .scrollable) {
                        ForEach(nutritionalInfo.keyNutrients, id: \.self) { nutrient in
                            Text(nutrient)
                                .font(.caption)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.blue.opacity(0.1))
                                .foregroundColor(.blue)
                                .cornerRadius(8)
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}


#Preview {
    NutritionFactsCard(nutritionalInfo: exampleResponse.nutritionalInfo)
}
