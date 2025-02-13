//
//  UIButtons.swift
//  TypicalABC
//
//  Created by Italo Guilherme Monte on 13/02/25.
//
import SwiftUI

struct UIButtons: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var coordinator: Coordinator
    
    var buttons: [String] = []
    
    var body: some View {
        HStack {
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {}
                .buttonStyle(PressableButtonStyle(normalImage: buttons[0], pressedImage: buttons[0] + "Pressed", width: 100))
            
            Spacer()
            
            HStack{
                Button { } label: { }
                    .buttonStyle(PressableButtonStyle(normalImage: buttons[1], pressedImage: buttons[1] + "Pressed", width: 100))
                if buttons.count > 2 {
                    Button {} label: { }
                        .buttonStyle(PressableButtonStyle(normalImage: buttons[2], pressedImage: buttons[2] + "Pressed", width: 100))
                }
                
            }
            
        }.padding()
        .padding(.horizontal)
    }
}
