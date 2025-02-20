//
//  UIButtons.swift
//  TypicalABC
//
//  Created by Italo Guilherme Monte on 13/02/25.
//
import SwiftUI

struct UIButtons: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var buttons: [(String, () -> Void)] = []
    var body: some View {
        VStack{
            HStack {
                
                if buttons.count > 1 {
                    Button {
                        buttons[0].1()
                    } label: {}
                        .buttonStyle(PressableButtonStyle(normalImage: buttons[0].0, pressedImage: buttons[0].0 + "Pressed", width: 100))
                    
                }

                Spacer()
                
                HStack{
                    Button {
                        buttons[ buttons.count > 1 ? 1 : 0].1() }
                    label: { }
                        .buttonStyle(PressableButtonStyle(normalImage: buttons[buttons.count > 1 ? 1 : 0].0, pressedImage: buttons[buttons.count > 1 ? 1 : 0].0 + "Pressed", width: 100))
                    if buttons.count > 2 {
                        Button {
                            buttons[2].1()
                        } label: {  }
                            .buttonStyle(PressableButtonStyle(normalImage: buttons[2].0, pressedImage: buttons[2].0 + "Pressed", width: 100))
                    }
                    
                }
                
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
    }
}
