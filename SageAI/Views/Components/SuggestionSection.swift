//
//  SuggestionSection.swift
//  SageAI
//
//  Created by Giovanna Moeller on 06/12/24.
//

import SwiftUI

struct SuggestionSection: View {
    let title: String
    let items: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            ForEach(items, id: \.self) { item in
                HStack(alignment: .top) {
                    Image(systemName: "circle.fill")
                        .font(.system(size: 6))
                        .padding(.top, 6)
                    Text(item)
                        .font(.subheadline)
                }
            }
        }
    }
}

#Preview {
    SuggestionSection(title: "Title", items: ["Item 1", "Item 2", "Item 3"])
}
