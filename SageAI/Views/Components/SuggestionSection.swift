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
    let icon: String
    let iconColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12.0) {
            HStack(spacing: 8.0) {
                Image(systemName: icon)
                    .foregroundStyle(iconColor)
                Text(title)
                    .font(.headline)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            VStack(alignment: .leading, spacing: 12.0) {
                ForEach(items, id: \.self) { item in
                    HStack(alignment: .top, spacing: 12.0) {
                        Circle()
                            .fill(iconColor.opacity(0.2))
                            .frame(width: 8, height: 8)
                            .padding(.top, 8)
                        
                        Text(item)
                            .font(.body)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(.leading, 4)
                }
            }
        }
    }
}

#Preview {
    SuggestionSection(title: "Title",
                      items: ["Item 1", "Item 2", "Item 3"],
                      icon: "plus.circle",
                      iconColor: .green)
}
