//
//  UIButtons.swift
//  TypicalABC
//
//  Created by Italo Guilherme Monte on 13/02/25.
//
import SwiftUI

struct UIButtons: View {
    
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var settingsManager: SettingsManager
    
    var buttons: [(String, () -> Void)]
    let geo: GeometryProxy

    var body: some View {
        
        let widthButton = calculatePercent(dimensionValue: 174, dimension: .width, geo: geo)
        
        VStack{
            HStack {
                
                if buttons.count > 1 {
                    Button {
                        buttons[0].1()
                        
                        if settingsManager.soundEffectsEnable{
                            audioManager.sounds.first(where: { $0.filename == .genericFeedback})?.player?.play()
                        }
                    } label: {}
                        .buttonStyle(PressableButtonStyle(normalImage: buttons[0].0, pressedImage: buttons[0].0 + "Pressed", width: widthButton))
                    
                }

                Spacer()
                
                HStack{
                    Button {
                        buttons[1].0 == "SettingsBtn" ? (settingsManager.showSettingsPopUp = true) : ()
                        print(settingsManager.showSettingsPopUp)
                        buttons[ buttons.count > 1 ? 1 : 0].1()
                        if settingsManager.soundEffectsEnable {
                            audioManager.sounds.first(where: { $0.filename == .genericFeedback})?.player?.play()
                        }
                        
                    }
                    label: { }
                        .buttonStyle(PressableButtonStyle(normalImage: buttons[buttons.count > 1 ? 1 : 0].0, pressedImage: buttons[buttons.count > 1 ? 1 : 0].0 + "Pressed", width: widthButton))
                    if buttons.count > 2 {
                        Button {
                            buttons[2].0 == "SettingsBtn" ? (settingsManager.showSettingsPopUp = true) : ()
                            print(settingsManager.showSettingsPopUp)

                            buttons[2].1()
                            
                            if settingsManager.soundEffectsEnable {
                                audioManager.sounds.first(where: { $0.filename == .genericFeedback})?.player?.play()
                            }
                            
                        } label: {  }
                            .buttonStyle(PressableButtonStyle(normalImage: buttons[2].0, pressedImage: buttons[2].0 + "Pressed", width: widthButton))
                    }
                    
                }
                
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()

    }
}
