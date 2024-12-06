//
//  FlowLayout.swift
//  SageAI
//
//  Created by Giovanna Moeller on 06/12/24.
//

import SwiftUI

struct FlowLayout: Layout {
    var mode: Mode = .scrollable
    
    enum Mode {
        case scrollable, stack
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let sizes = subviews.map { $0.sizeThatFits(.unspecified) }
        var width: CGFloat = 0
        var height: CGFloat = 0
        var x: CGFloat = 0
        var y: CGFloat = 0
        var rowHeight: CGFloat = 0
        
        for size in sizes {
            if x + size.width > (proposal.width ?? 0) {
                x = 0
                y += rowHeight + 8
                rowHeight = 0
            }
            
            x += size.width + 8
            width = max(width, x)
            rowHeight = max(rowHeight, size.height)
            height = y + rowHeight
        }
        
        return CGSize(width: width, height: height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var x = bounds.minX
        var y = bounds.minY
        var rowHeight: CGFloat = 0
        
        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            
            if x + size.width > bounds.maxX {
                x = bounds.minX
                y += rowHeight + 8
                rowHeight = 0
            }
            
            subview.place(at: CGPoint(x: x, y: y), proposal: .unspecified)
            x += size.width + 8
            rowHeight = max(rowHeight, size.height)
        }
    }
}
