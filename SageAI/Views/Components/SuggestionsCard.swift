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
        VStack(alignment: .leading, spacing: 24.0) {
            HStack {
                Text("Suggestions")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.yellow)
            }
            
            VStack(alignment: .leading, spacing: 24.0) {
                SuggestionSection(title: "Alternatives",
                                  items: suggestions.alternatives,
                                  icon: "arrow.triangle.2.circlepath",
                                  iconColor: .blue)
                SuggestionSection(title: "Modifications",
                                  items: suggestions.modifications,
                                  icon: "slider.horizontal.3",
                                  iconColor: .orange)
                SuggestionSection(title: "Complementary Foods",
                                  items: suggestions.complementaryFoods,
                                  icon: "plus.circle",
                                  iconColor: .green)
            }
        }
        .padding(20)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(radius: 1)
    }
}
#Preview {
    SuggestionsCard(suggestions: exampleResponse.suggestions)
}
