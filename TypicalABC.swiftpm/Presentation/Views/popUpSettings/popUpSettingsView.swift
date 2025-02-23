//
//  popUpSettings.swift
//  TypicalABC
//
//  Created by Italo Guilherme Monte on 23/02/25.
//

import SwiftUI

struct PopUpSettingsView: View {
    
    @EnvironmentObject var settingsManager: SettingsManager
    @EnvironmentObject var audioManager: AudioManager
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.55)
                .ignoresSafeArea()
            
            ZStack{
                
                //bg
                Image("popUpBg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: (794 / 1620) * UIScreen.main.bounds.width)
                
                // button close
                VStack{
                    
                    HStack{
                        Button {
                            settingsManager.showSettingsPopUp = false
                            if settingsManager.soundEffectsEnable {
                                audioManager.sounds.first(where: {$0.filename == .genericFeedback})?.player?.play()
                            }
                        } label: {}
                            .buttonStyle(PressableButtonStyle(normalImage: "CloseBtn", pressedImage: "CloseBtnPressed", width: (128 / 1620) * UIScreen.main.bounds.width))
                        
                        Spacer()
                    }
                    .padding(.vertical)
                    Spacer()
                }
                .frame(width: (720 / 1620) * UIScreen.main.bounds.width, height: (550 / 1620) * UIScreen.main.bounds.width)
                .padding(.vertical)
                
                // Content
                VStack{
                    Spacer()
                    
                    HStack{
                        HStack (spacing: 50) {
                            Image("settingsMSC")
                                .resizable()
                                .scaledToFit()
                                .frame(width: (100 / 1620) * UIScreen.main.bounds.width)
                            
                            Text("Background Music")
                                .font(.patrickHand)
                        }
                        Spacer()
                        
                        Image(settingsManager.musicEnable ? "settingsToggleTrue" : "settingsToggleFalse")
                            .resizable()
                            .scaledToFit()
                            .frame(width: (150 / 1620) * UIScreen.main.bounds.width)
                            .onTapGesture {
                                settingsManager.musicEnable.toggle()
                                if settingsManager.soundEffectsEnable {
                                    audioManager.sounds.first(where: {$0.filename == .genericFeedback})?.player?.play()
                                }
                            }
                    }
                    
                    HStack{
                        HStack (spacing: 50){
                            Image("settingsSEF")
                                .resizable()
                                .scaledToFit()
                                .frame(width: (100 / 1620) * UIScreen.main.bounds.width)
                            
                            Text("Sound Effects")
                                .font(.patrickHand)
                            
                        }
                        
                        Spacer()
                        Image(settingsManager.soundEffectsEnable ? "settingsToggleTrue" : "settingsToggleFalse")
                            .resizable()
                            .scaledToFit()
                            .frame(width: (150 / 1620) * UIScreen.main.bounds.width)
                            .onTapGesture {
                                settingsManager.soundEffectsEnable.toggle()
                                print("sfx: ", settingsManager.showSettingsPopUp)
                                if settingsManager.soundEffectsEnable {
                                    audioManager.sounds.first(where: {$0.filename == .genericFeedback})?.player?.play()
                                }
                            }

                    }
                    
                    HStack{
                        HStack (spacing: 50) {
                            Image("settingsFilter")
                                .resizable()
                                .scaledToFit()
                                .frame(width: (100 / 1620) * UIScreen.main.bounds.width)
                            
                            Text("Color Filter")
                                .font(.patrickHand)
                        }
                        Spacer()
                        Image(settingsManager.colorFilterEnable ? "settingsToggleTrue" : "settingsToggleFalse")
                            .resizable()
                            .scaledToFit()
                            .frame(width: (150 / 1620) * UIScreen.main.bounds.width)
                            .onTapGesture {
                                settingsManager.colorFilterEnable.toggle()
                                if settingsManager.soundEffectsEnable {
                                    audioManager.sounds.first(where: {$0.filename == .genericFeedback})?.player?.play()
                                }
                            }

                    }
                }
                .padding(.horizontal)
                .frame(width: (750 / 1620) * UIScreen.main.bounds.width, height: (700 / 1620) * UIScreen.main.bounds.width)
            }
        }

    }
}
