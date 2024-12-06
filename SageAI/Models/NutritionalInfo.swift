//
//  NutritionalInfo.swift
//  SageAI
//
//  Created by Giovanna Moeller on 04/12/24.
//

import Foundation

struct NutritionalInfo: Codable {
    let calories: Int
    let protein: Double
    let carbs: CarbBreakdown
    let fat: FatBreakdown
    let fiber: Double
    let keyNutrients: [String]
    
    enum CodingKeys: String, CodingKey {
        case calories, protein, carbs, fat, fiber
        case keyNutrients = "key_nutrients"
    }
}
