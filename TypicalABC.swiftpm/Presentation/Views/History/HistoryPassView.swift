//
//  SwiftUIView.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 06/02/25.
//

import SwiftUI

struct HistoryPassView: View {
    
    
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var audioManager: AudioManager
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var historyPassVm = HistoryPassViewModel()

    @State var isSettingOpen = false
    @State var bgFramesPerSecond: Int = 1
        
    var body: some View {
        GeometryReader { geo in
            ZStack{
                // Background
                ImageLoop(assets: $historyPassVm.historyBgMoment, indexHistoryStep: $historyPassVm.indexHistoryStep, framesPerSecond: $bgFramesPerSecond, contentMode: .fill)
                    .ignoresSafeArea()
                    .onAppear{
                        print(historyPassVm.historyBgMoment)
                    }
                    .onChange(of: historyPassVm.historyBgMoment) { _, newValue in
                        print(newValue)
                    }
                
                // Card Content
                if historyPassVm.indexHistoryMoment > 4 && historyPassVm.indexHistoryMoment < 7 {
                    Color.black.opacity(0.45)
                        .ignoresSafeArea()
                    
                    CardsContainer(geo: geo, historyPassVm: historyPassVm)
                }
                
                // DreamBoards
                if historyPassVm.indexHistoryMoment >= 7 && historyPassVm.indexHistoryMoment < 9 {
                    Color.black.opacity(0.45)
                        .ignoresSafeArea()
                    VStack{
                        Image("H" + String(historyPassVm.indexHistoryMoment + 2))
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: geo.size.width * 0.95)
                        
                        Spacer()
                    }
                }
                
                // Text
                VStack{
                    Spacer()
                    TextContainer(historyPassVm: historyPassVm, geo: geo)
                }
                .padding()
                
                // UI Button Settings
                UIButtons(buttons: [
                    ("CloseBtn", {dismiss()
                        stopCurrentAudio()
                    }),
                    ("SettingsBtn", {isSettingOpen = true})
                ], geo: geo)
                
            }
        }
        .onAppear{
            audioManager.setupAudios(from: .init(filename: [.h1, .h2, .h3, .h4, .h5, .h6, .h7, .h8, .h9], fileExtension: .m4a, volume: 1))
        }
        
        .onChange(of: historyPassVm.goToCallMinigames, { oldValue, newValue in
            if newValue {
                coordinator.push(page: .CallToMinigames)
            }
        })
        .navigationBarBackButtonHidden(true)
        
    }
    
    private func stopCurrentAudio() {
        audioManager.sounds.first(where: { $0.filename.rawValue == "H\(historyPassVm.indexHistoryMoment + 1)" })?.player?.stop()
        historyPassVm.timerAudio?.invalidate()
        historyPassVm.timerAudio = nil
        historyPassVm.isPlayingSound = false
        historyPassVm.soundVolume = 1
    }

}

