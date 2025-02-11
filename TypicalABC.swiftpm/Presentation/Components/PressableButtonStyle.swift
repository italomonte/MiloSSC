//
//  SwiftUIView.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 08/02/25.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    var normalImage: String
    var pressedImage: String
    var width: CGFloat
    func makeBody(configuration: Configuration) -> some View {
        Image(configuration.isPressed ? pressedImage : normalImage)
            .resizable()
            .scaledToFit()
            .frame(width: width) // Ajuste conforme necessário
    }
}
