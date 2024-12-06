//
//  DietaryInfoCard.swift
//  SageAI
//
//  Created by Giovanna Moeller on 06/12/24.
//

import SwiftUI

struct DietaryInfoCard: View {
    let dietaryInfo: DietaryInfo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Dietary Information")
                    .font(.headline)
                Spacer()
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
            
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Suitable Diets")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    FlowLayout(mode: .scrollable) {
                        ForEach(dietaryInfo.suitableDiets, id: \.self) { diet in
                            Text(diet)
                                .font(.caption)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.green.opacity(0.1))
                                .foregroundColor(.green)
                                .cornerRadius(8)
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Allergens")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    FlowLayout(mode: .scrollable) {
                        ForEach(dietaryInfo.allergens, id: \.self) { allergen in
                            Text(allergen)
                                .font(.caption)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.red.opacity(0.1))
                                .foregroundColor(.red)
                                .cornerRadius(8)
                        }
                    }
                }
                
                HStack {
                    Text("Glycemic Load:")
                        .foregroundColor(.secondary)
                    Text(dietaryInfo.glycemicLoad)
                        .fontWeight(.medium)
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
    DietaryInfoCard(dietaryInfo: exampleResponse.dietaryInfo)
}
