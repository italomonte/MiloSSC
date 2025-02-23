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
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var settingsManager: SettingsManager

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
                        audioManager.sounds.first(where: {$0.filename == .victoryFluffies})?.player?.stop()

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
        .onAppear{
            audioManager.setupAudios(from: .init(filename: [.winningFeedback], fileExtension: .wav, volume: 1))
            audioManager.setupAudios(from: .init(filename: [.victoryFluffies], fileExtension: .m4a, volume: 1))
            
            if settingsManager.soundEffectsEnable {
                audioManager.sounds.first(where: {$0.filename == .winningFeedback})?.player?.play()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                audioManager.sounds.first(where: {$0.filename == .victoryFluffies})?.player?.play()
                
                
            }
        }
    }
    
}


