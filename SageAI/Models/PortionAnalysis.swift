//
//  PortionAnalysis.swift
//  SageAI
//
//  Created by Giovanna Moeller on 04/12/24.
//

import Foundation

struct PortionAnalysis: Codable {
    let isAppropriate: Bool
    let idealPortion: String
    let caloricDensity: String
    
    enum CodingKeys: String, CodingKey {
        case isAppropriate = "is_appropriate"
        case idealPortion = "ideal_portion"
        case caloricDensity = "caloric_density"
    }
}
