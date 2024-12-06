//
//  Suggestions.swift
//  SageAI
//
//  Created by Giovanna Moeller on 04/12/24.
//

import Foundation

struct Suggestions: Codable, Equatable {
    let alternatives: [String]
    let modifications: [String]
    let complementaryFoods: [String]
    
    enum CodingKeys: String, CodingKey {
        case alternatives, modifications
        case complementaryFoods = "complementary_foods"
    }
    
    static func == (lhs: Suggestions, rhs: Suggestions) -> Bool {
        lhs.alternatives == rhs.alternatives && lhs.modifications == rhs.modifications && lhs.complementaryFoods == rhs.complementaryFoods
    }
}
