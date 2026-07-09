//
//  ProgresssLoaderModifier.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 29/01/25.
//

import SwiftUI

struct ProgresssLoaderModifier: ViewModifier {
    @Binding var isLoading: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .blur(radius: isLoading ? 3 : 0)
            
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .frame(width: 100, height: 100)
            }
        }
    }
}

extension View {
    func showLoading(isLoading: Binding<Bool>) -> some View {
        self.modifier(ProgresssLoaderModifier(isLoading: isLoading))
    }
}
