//
//  OnboardingStep.swift
//  SageAI
//
//  Created by Giovanna Moeller on 04/12/24.
//

import Foundation

struct OnboardingStep: Identifiable, Equatable {
    let id = UUID()
    let image: String
    let title: String
    let description: String
}
