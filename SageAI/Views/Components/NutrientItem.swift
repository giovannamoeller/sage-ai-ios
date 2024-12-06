//
//  NutrientItem.swift
//  SageAI
//
//  Created by Giovanna Moeller on 06/12/24.
//

import SwiftUI

struct NutrientItem: View {
    let label: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .fontWeight(.medium)
        }
    }
}

#Preview {
    NutrientItem(label: "Calorias", value: "360kcal")
}
