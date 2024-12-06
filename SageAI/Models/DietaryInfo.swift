//
//  DietaryInfo.swift
//  SageAI
//
//  Created by Giovanna Moeller on 04/12/24.
//

import Foundation

struct DietaryInfo: Codable {
    let allergens: [String]
    let suitableDiets: [String]
    let glycemicLoad: String
    
    enum CodingKeys: String, CodingKey {
        case allergens
        case suitableDiets = "suitable_diets"
        case glycemicLoad = "glycemic_load"
    }
}
