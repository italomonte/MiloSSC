//
//  SwiftUIView.swift
//  TypicalSSC
//

import SwiftUI

struct CallToMinigamesView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var isSettingOpen = false

    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var audioManager: AudioManager
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                
                // Background
                Image("callToActionMinigamesBg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                HStack{
                    Spacer()
                    VStack (spacing: 70){
                        VStack(spacing: 25){
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 0.31 * geo.size.width)
                            
                            VStack(alignment: .leading, spacing: 25){
                                Text("How about starting to explore worlds through words like Charlie?")
                                    .font(.patrickHandBigger)

                                Text("Here are a lot of games for you to have fun and learn!")
                                    .font(.patrickHandBigger)

                            }
                            .multilineTextAlignment(.center)
                            .font(.patrickHandBigger)
                            .frame(maxWidth: geo.size.width * 0.35)
                        }
                        .foregroundStyle(.white)
                        
                        Button {
                            coordinator.push(page: .MinigamesMenuView)
                            audioManager.sounds.first(where: { $0.filename == .genericFeedback})?.player?.play()

                        } label: {}
                            .buttonStyle(PressableButtonStyle(normalImage: "PlayBtn", pressedImage: "PlayBtnPressed", width: 150))
                        
                    }.frame(width: 0.5 * geo.size.width)
                }
                
                // UI
                UIButtons(buttons: [
                    ("InfoBtn", {coordinator.push(page: .InfoView)}),
                    ("SettingsBtn", {isSettingOpen = true}),
                ], geo: geo)
                
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}
