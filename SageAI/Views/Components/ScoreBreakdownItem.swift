//
//  ScoreBreakdownItem.swift
//  SageAI
//
//  Created by Giovanna Moeller on 06/12/24.
//

import SwiftUI

struct ScoreBreakdownItem: View {
    let label: String
    let value: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label) 
                .font(.caption)
                .foregroundColor(.secondary)
            Text("\(value)/100")
                .fontWeight(.medium)
        }
    }
}

#Preview {
    ScoreBreakdownItem(label: "Score", value: 200)
}
