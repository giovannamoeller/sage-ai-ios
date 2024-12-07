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
        VStack {
            // Header
            HStack {
                Text("Nutrition Facts")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "leaf.fill")
                    .foregroundColor(.green)
            }
            .padding(28)
            
            // Main Nutrients Grid
            VStack(spacing: 32) {
                // Top Row: Calories and Protein
                HStack {
                    NutrientItem(
                        label: "Calories",
                        value: "\(nutritionalInfo.calories)",
                        unit: "kcal"
                    )
                    Spacer()
                    NutrientItem(
                        label: "Protein",
                        value: String(format: "%.1f", nutritionalInfo.protein),
                        unit: "g"
                    )
                }
                
                // Middle Row: Carbs and Fat
                HStack {
                    NutrientItem(
                        label: "Total Carbs",
                        value: String(format: "%.1f", nutritionalInfo.carbs.total),
                        unit: "g"
                    )
                    Spacer()
                    NutrientItem(
                        label: "Total Fat",
                        value: String(format: "%.1f", nutritionalInfo.fat.total),
                        unit: "g"
                    )
                }
                
                // Bottom Row: Fiber
                HStack {
                    NutrientItem(
                        label: "Fiber",
                        value: String(format: "%.1f", nutritionalInfo.fiber),
                        unit: "g"
                    )
                    Spacer()
                }
            }
            .padding()
            
            Divider()
                .padding(.vertical, 8)
            
            // Key Nutrients Section
            VStack(alignment: .leading, spacing: 12) {
                Text("Key Nutrients")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                FlowLayout(spacing: 8) {
                    ForEach(nutritionalInfo.keyNutrients, id: \.self) { nutrient in
                        Text(nutrient)
                            .font(.subheadline)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.blue.opacity(0.1))
                            .foregroundColor(.blue)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()
        }
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(radius: 1)
    }
}

#Preview {
    NutritionFactsCard(nutritionalInfo: exampleResponse.nutritionalInfo)
}
