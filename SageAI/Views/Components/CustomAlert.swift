//
//  CustomAlert.swift
//  SageAI
//
//  Created by Giovanna Moeller on 06/12/24.
//

import SwiftUI

enum AlertType {
    case error
    case informative
    
    var icon: String {
        switch self {
        case .error:
            return "exclamationmark.triangle.fill"
        case .informative:
            return "info.circle.fill"
        }
    }
    
    var title: String {
        switch self {
        case .error:
            return "Error"
        case .informative:
            return "Information"
        }
    }
    
    var buttonTitle: String {
        switch self {
        case .error:
            return "Try again"
        case .informative:
            return "Close"
        }
    }
}

struct CustomAlert: View {
    //let title: String
    let message: String
    //let primaryButtonTitle: String
    let primaryAction: () -> Void
    var secondaryButtonTitle: String? = nil
    var secondaryAction: (() -> Void)? = nil
    var alertType: AlertType
    @Binding var isPresented: Bool
    
    init(//title: String,
         message: String,
         //primaryButtonTitle: String,
         primaryAction: @escaping () -> Void,
         secondaryButtonTitle: String? = nil,
         secondaryAction: (() -> Void)? = nil,
         alertType: AlertType = .error,
         isPresented: Binding<Bool>) {
        //self.title = title
        self.message = message
        //self.primaryButtonTitle = primaryButtonTitle
        self.primaryAction = primaryAction
        self.secondaryButtonTitle = secondaryButtonTitle
        self.secondaryAction = secondaryAction
        self.alertType = alertType
        self._isPresented = isPresented
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20.0) {
                Image(systemName: alertType.icon)
                    .font(.system(size: 36))
                    .foregroundColor(.accent)
                
                Text(alertType.title)
                    .font(.title3.bold())
                    .multilineTextAlignment(.center)
                
                Text(message)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                
                VStack(spacing: 12.0) {
                    Button(action: {
                        primaryAction()
                        isPresented = false
                    }) {
                        Text(alertType.buttonTitle)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    
                    if let secondaryButtonTitle = secondaryButtonTitle,
                       let secondaryAction = secondaryAction {
                        Button(action: {
                            secondaryAction()
                            isPresented = false
                        }) {
                            Text(secondaryButtonTitle)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .foregroundColor(.primary)
                                .cornerRadius(12)
                        }
                    }
                }
            }
            .padding(24)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemBackground))
                    .shadow(radius: 15)
            )
            .padding(.horizontal, 40)
            .transition(.opacity.combined(with: .scale))
        }
    }
}

#Preview {
    CustomAlert(message: "How are you?", primaryAction: {}, secondaryButtonTitle: "Okay", secondaryAction: {}, isPresented: .constant(true))
}
