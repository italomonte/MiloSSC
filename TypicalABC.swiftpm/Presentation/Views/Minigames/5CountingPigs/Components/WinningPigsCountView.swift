//
//  dwada.swift
//  TypicalABC
//
//  Created by Italo Guilherme Monte on 20/02/25.
//

import SwiftUI
import PencilKit

struct WinningPigsCountView: View {
    
    @EnvironmentObject var audioManager: AudioManager
        
    let geo: GeometryProxy
    
    @Binding var canvasView: PKCanvasView
    @Binding var hasDrawn: Bool
    
    var body: some View {
        ZStack {
            Image("pigsBg")
                .resizable()
                .scaledToFill()
            
            VStack {
                Image("modalBar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: calculatePercent(dimensionValue: 72, dimension: .width, geo: geo))
                    .padding(.top, calculatePercent(dimensionValue: 60, dimension: .height, geo: geo))
                
                Spacer()
                
                Image("thatsRight")
                    .resizable()
                    .scaledToFit()
                    .frame(width: calculatePercent(dimensionValue: 833, dimension: .width, geo: geo))
                
                Text("You managed to count and write the number of pigs!")
                    .font(.patrickHandBigger)
                    .foregroundStyle(Color.lightBlue)
                    .padding(.bottom)
                
                Text("Knowing numbers and how to count it's very important — keep practicing and having fun.")
                    .font(.patrickHandBigger)
                    .foregroundStyle(Color.lightBlue)
                    .padding(.bottom)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: calculatePercent(dimensionValue: 1440, dimension: .width, geo: geo))
                
                Spacer()
                
                // Try Again Button
                Button {
                    withAnimation {
                        hasDrawn = false
                    }
                    canvasView.drawing = .init()
                    audioManager.sounds.first(where: {$0.filename == .victoryCounting})?.player?.stop()

                } label: {}
                    .buttonStyle(PressableButtonStyle(normalImage: "KeepPlayingBtn", pressedImage: "KeepPlayingBtnPressed", width: 350))
                    .padding(.bottom, 30)
                
            }
        }
        .frame(maxWidth: geo.size.width, maxHeight: calculatePercent(dimensionValue: 1095, dimension: .height, geo: geo))
        .background(.white)
        .onAppear{
            audioManager.setupAudios(from: .init(filename: [.winningFeedback], fileExtension: .wav, volume: 1))
            audioManager.setupAudios(from: .init(filename: [.victoryCounting], fileExtension: .m4a, volume: 1))
            audioManager.sounds.first(where: {$0.filename == .winningFeedback})?.player?.play()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                audioManager.sounds.first(where: {$0.filename == .victoryCounting})?.player?.play()
            }
        }
        
    }
}
