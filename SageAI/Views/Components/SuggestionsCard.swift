//
//  SuggestionsCard.swift
//  SageAI
//
//  Created by Giovanna Moeller on 06/12/24.
//

import SwiftUI

struct SuggestionsCard: View {
    let suggestions: Suggestions
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text("Suggestions")
                    .font(.headline)
                Spacer()
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.yellow)
            }
            
            VStack(alignment: .leading, spacing: 16) {
                SuggestionSection(title: "Alternatives", items: suggestions.alternatives)
                SuggestionSection(title: "Modifications", items: suggestions.modifications)
                SuggestionSection(title: "Complementary Foods", items: suggestions.complementaryFoods)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}
#Preview {
    SuggestionsCard(suggestions: exampleResponse.suggestions)
}
