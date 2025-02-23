//
//  popUpSettings.swift
//  TypicalABC
//
//  Created by Italo Guilherme Monte on 23/02/25.
//

import SwiftUI

struct PopUpSettingsView: View {
    
    @ObservedObject var settingsManager: SettingsManager
    @ObservedObject var audioManager: AudioManager
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.55)
                .ignoresSafeArea()
            
            ZStack{
                Image("popUpBg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: (794 / 1620) * UIScreen.main.bounds.width)
                
                VStack{
                    HStack{
                        Button {
                            settingsManager.showSettingsPopUp = false
                            audioManager.sounds.first(where: {$0.filename == .genericFeedback})?.player?.play()
                        } label: {}
                            .buttonStyle(PressableButtonStyle(normalImage: "CloseBtn", pressedImage: "CloseBtnPressed", width: (128 / 1620) * UIScreen.main.bounds.width))
                        
                        Spacer()
                    }
                    .padding(.vertical)
                    Spacer()
                }
                .frame(width: (750 / 1620) * UIScreen.main.bounds.width, height: (600 / 1620) * UIScreen.main.bounds.width)
                .padding(.vertical)

            }
        }

    }
}
