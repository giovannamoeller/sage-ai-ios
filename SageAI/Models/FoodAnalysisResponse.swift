//
//  FoodAnalysisResponse.swift
//  SageAI
//
//  Created by Giovanna Moeller on 04/12/24.
//

import Foundation

struct FoodAnalysisResponse: Codable {
    let nutritionalInfo: NutritionalInfo
    let healthScore: HealthScore
    let dietaryInfo: DietaryInfo
    let suggestions: Suggestions
    let portionAnalysis: PortionAnalysis
    
    enum CodingKeys: String, CodingKey {
        case nutritionalInfo = "nutritional_info"
        case healthScore = "health_score"
        case dietaryInfo = "dietary_info"
        case suggestions
        case portionAnalysis = "portion_analysis"
    }
}
