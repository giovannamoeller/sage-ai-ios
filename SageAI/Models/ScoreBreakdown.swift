//
//  ScoreBreakdown.swift
//  SageAI
//
//  Created by Giovanna Moeller on 04/12/24.
//

import Foundation

struct ScoreBreakdown: Codable {
    let nutritionalBalance: Int
    let portionSize: Int
    let wholeFoods: Int
    let nutrientDensity: Int
    
    enum CodingKeys: String, CodingKey {
        case nutritionalBalance = "nutritional_balance"
        case portionSize = "portion_size"
        case wholeFoods = "whole_foods"
        case nutrientDensity = "nutrient_density"
    }
}
