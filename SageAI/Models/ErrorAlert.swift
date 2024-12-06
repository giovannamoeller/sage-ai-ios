//
//  ErrorAlert.swift
//  SageAI
//
//  Created by Giovanna Moeller on 04/12/24.
//

import SwiftUI

struct ErrorAlert: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let primaryButton: Alert.Button
    var secondaryButton: Alert.Button?
    
    static func basic(
        title: String = "Error",
        message: String,
        buttonTitle: String = "OK",
        action: (() -> Void)? = nil
    ) -> ErrorAlert {
        ErrorAlert(
            title: title,
            message: message,
            primaryButton: .default(Text(buttonTitle), action: action)
        )
    }
}
