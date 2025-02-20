//
//  Template.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 10/02/25.
//



import SwiftUI

struct ExploringAlphabetVictoryView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var coordinator: Coordinator
    @State var isSettingOpen = false

    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                
                // Background
                Image("alphabetVictoryBg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Image("youDidIt")
                        .resizable()
                        .scaledToFit()
                        .frame(width: calculatePercent(dimensionValue: 980, dimension: .width, geo: geo))
                        .padding(.bottom)
                    
                    Text("You managed to draw all the alphabet letters.")
                        .font(.patrickHandExtremeBigger)
                        .frame(maxWidth: calculatePercent(dimensionValue: 1000, dimension: .width, geo: geo))
                        .multilineTextAlignment(.center)
                    
                    Text("Knowing how to write and identify letters is very important for reading—keep practicing and having fun!")
                        .font(.patrickHandExtremeBigger)
                        .frame(maxWidth: calculatePercent(dimensionValue: 1026, dimension: .width, geo: geo))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, calculatePercent(dimensionValue: 30, dimension: .height, geo: geo))

                    // Try Again Button
                    Button {
                        dismiss()
                    } label: {}
                        .buttonStyle(PressableButtonStyle(normalImage: "KeepPlayingBtn", pressedImage: "KeepPlayingBtnPressed", width: 350))
                        .padding(.top, 30)
                }
                .foregroundStyle(.white)

                
                
                
                // UI
                UIButtons(buttons: [
                    ("SettingsBtn", {isSettingOpen = true})
                ])
                
                
                
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}
