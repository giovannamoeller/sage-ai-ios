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
        VStack(spacing: 20) {
            // Header
            HStack {
                Text("Health Score")
                    .font(.title2)
                    .fontWeight(.semibold)
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            
            // Main Score
            HStack {
                Text("\(score.total)")
                    .font(.system(size: 56, weight: .bold))
                Text("/100")
                    .font(.system(size: 24))
                    .foregroundColor(.gray)
                    .baselineOffset(20) // Align with the main number
            }
            
            // Progress Bar
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color.secondary.opacity(0.2))
                        .frame(height: 6)
                        .cornerRadius(3)
                    
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: CGFloat(score.total) / 100 * geometry.size.width, height: 6)
                        .cornerRadius(3)
                }
            }
            .frame(height: 6)
            .padding(.bottom, 10)
            
            // Score Breakdown Grid
            Grid(alignment: .leading, horizontalSpacing: 32.0, verticalSpacing: 32.0) {
                GridRow {
                    ScoreBreakdownItem(
                        label: "Nutritional Balance",
                        value: score.breakdown.nutritionalBalance
                    )
                    ScoreBreakdownItem(
                        label: "Portion Size",
                        value: score.breakdown.portionSize
                    )
                }
                
                GridRow {
                    ScoreBreakdownItem(
                        label: "Whole Foods",
                        value: score.breakdown.wholeFoods
                    )
                    ScoreBreakdownItem(
                        label: "Nutrient Density",
                        value: score.breakdown.nutrientDensity
                    )
                }
            }
        }
        .padding(20)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(radius: 1)
    }
}

#Preview {
    HealthScoreCard(score: exampleResponse.healthScore)
}
