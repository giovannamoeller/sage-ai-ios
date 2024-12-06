//
//  HealthScoreCard.swift
//  SageAI
//
//  Created by Giovanna Moeller on 06/12/24.
//

import SwiftUI

struct HealthScoreCard: View {
    let score: HealthScore
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text("Health Score")
                    .font(.headline)
                Spacer()
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            
            Text("\(score.total)")
                .font(.system(size: 48, weight: .bold))
                + Text("/100")
                .font(.title2)
                .foregroundColor(.secondary)
            
            // Progress Bar
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.secondary.opacity(0.2))
                        .frame(height: 8)
                        .cornerRadius(4)
                    
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: CGFloat(score.total) / 100 * geometry.size.width, height: 8)
                        .cornerRadius(4)
                }
            }
            .frame(height: 8)
            
            // Score Breakdown
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 16) {
                ScoreBreakdownItem(label: "Nutritional Balance", value: score.breakdown.nutritionalBalance)
                ScoreBreakdownItem(label: "Portion Size", value: score.breakdown.portionSize)
                ScoreBreakdownItem(label: "Whole Foods", value: score.breakdown.wholeFoods)
                ScoreBreakdownItem(label: "Nutrient Density", value: score.breakdown.nutrientDensity)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}


#Preview {
    HealthScoreCard(score: exampleResponse.healthScore)
}
