//
//  Template.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 10/02/25.
//



import SwiftUI

struct OrderNumbersVictoryView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var coordinator: Coordinator
    @State var isSettingOpen = false

    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                
                // Background
                Image("numbersBg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                // Content
                Image("VictoryNumbersElements")
                    .resizable()
                    .scaledToFill()
                
                // Try Again Button
                VStack {
                    
                    Spacer(minLength: calculatePercent(dimensionValue: 1128, dimension: .height, geo: geo))

                    Button {
                        dismiss()
                    } label: {}
                        .buttonStyle(PressableButtonStyle(normalImage: "KeepPlayingBtn", pressedImage: "KeepPlayingBtnPressed", width: 350))
                        .padding(.top, 30)
                    
                    Spacer()
                }
                .padding()
                
                // UI
                UIButtons(buttons: [
                    ("CloseBtn", {coordinator.popTo(page: 3)}),
                    ("SettingsBtn", {isSettingOpen = true})
                ], geo: geo)
                
                
                
                
                
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}


