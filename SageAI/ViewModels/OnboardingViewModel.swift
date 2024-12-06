//
//  OnboardingViewModel.swift
//  SageAI
//
//  Created by Giovanna Moeller on 04/12/24.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var isOnboardingComplete: Bool = false
    @Published var currentStep: Int = 0
    
    let steps: [OnboardingStep] = [
        OnboardingStep(
            image: "healthy-food-1",
            title: "Smart Food Analysis",
            description: "Take a photo of your meal and get instant nutritional insights powered by AI"
        ),
        OnboardingStep(
            image: "healthy-food-2",
            title: "Restaurant Guide",
            description: "Discover healthy restaurant options nearby with personalized menu recommendations"
        ),
        OnboardingStep(
            image: "healthy-food-3",
            title: "Track Your Progress",
            description: "Monitor your health journey with comprehensive tracking and AI-powered insights"
        ),
        OnboardingStep(
            image: "healthy-food-4",
            title: "Ready to Begin?",
            description: "Start your journey to healthier decisions with SageAI"
        )
    ]
    
    var isLastStep: Bool {
        currentStep == steps.count - 1
    }
    
    func nextStep() {
        if currentStep < steps.count - 1 {
            currentStep += 1
        }
    }
    
    func previousStep() {
        if currentStep > 0 {
            currentStep -= 1
        }
    }
}
