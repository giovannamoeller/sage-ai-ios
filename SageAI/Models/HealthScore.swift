//
//  HealthScore.swift
//  SageAI
//
//  Created by Giovanna Moeller on 04/12/24.
//

import Foundation

struct HealthScore: Codable {
    let total: Int
    let breakdown: ScoreBreakdown
}
