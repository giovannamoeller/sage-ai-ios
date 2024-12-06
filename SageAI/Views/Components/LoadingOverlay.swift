//
//  LoadingOverlay.swift
//  SageAI
//
//  Created by Giovanna Moeller on 04/12/24.
//

import SwiftUI

struct LoadingOverlay: View {
    let message: String
    let circleSize: CGFloat = 60.0
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 1)
            
            VStack(spacing: 20.0) {
                ZStack {
                    Circle()
                        .stroke(lineWidth: 4)
                        .frame(width: circleSize, height: circleSize)
                        .foregroundColor(Color.accentColor.opacity(0.3))
                    
                    Circle()
                        .trim(from: 0, to: 0.7)
                        .stroke(lineWidth: 4)
                        .frame(width: circleSize, height: circleSize)
                        .foregroundColor(Color.accentColor)
                        .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                        .animation(
                            .linear(duration: 1)
                            .repeatForever(autoreverses: false),
                            value: isAnimating
                        )
                    
                    Circle()
                        .trim(from: 0, to: 0.5)
                        .stroke(lineWidth: 4)
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.accentColor.opacity(0.7))
                        .rotationEffect(Angle(degrees: isAnimating ? -360 : 0))
                        .animation(
                            .linear(duration: 0.8)
                            .repeatForever(autoreverses: false),
                            value: isAnimating
                        )
                }
                
                VStack(spacing: 8) {
                    Text(message)
                        .font(.headline)
                        .foregroundColor(.primary)
                }
                
                HStack(spacing: 8) {
                    ForEach(0..<3) { index in
                        Circle()
                            .fill(Color.accentColor)
                            .frame(width: 8, height: 8)
                            .scaleEffect(isAnimating ? 1.2 : 0.8)
                            .animation(
                                .easeInOut(duration: 0.6)
                                .repeatForever()
                                .delay(Double(index) * 0.2),
                                value: isAnimating
                            )
                    }
                }
            }
            .frame(maxWidth: screenWidth / 2)
            .padding(40)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(radius: 15)
            )
            .transition(.opacity)
        }
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    LoadingOverlay(message: "Hello, World!")
}
