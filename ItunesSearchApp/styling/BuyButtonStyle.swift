//
//  BuyButtonStyle.swift
//  ItunesSearchApp
//
//  Created by Boris Romão Antunes on 31/10/23.
//

import SwiftUI

struct BuyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label

            .foregroundColor(.accentColor)
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.accentColor, lineWidth: 1)
            }
            .opacity(configuration.isPressed ?  0.5 : 1)
    }
}

#Preview {
    VStack{
        Button("1.99 USD") {
            
        }
        .buttonStyle(BuyButtonStyle())
    }
}
