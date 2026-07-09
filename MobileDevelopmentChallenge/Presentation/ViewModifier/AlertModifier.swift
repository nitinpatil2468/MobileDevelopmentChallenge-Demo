//
//  AlertModifier.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 29/01/25.
//

import SwiftUI

struct AlertModifier: ViewModifier {
    
    @Binding var isPresented: Bool
    var title: String
    var message: String
    var dismissButtonText: String = "OK"
    
    func body(content: Content) -> some View {
        content
            .alert(isPresented: $isPresented) {
                Alert(
                    title: Text(title),
                    message: Text(message),
                    dismissButton: .default(Text(dismissButtonText))
                )
            }
    }
}

extension View {
    func showAlert(isPresented: Binding<Bool>, title: String, message: String, dismissButtonText: String = "OK") -> some View {
        self.modifier(AlertModifier(isPresented: isPresented, title: title, message: message, dismissButtonText: dismissButtonText))
    }
}

