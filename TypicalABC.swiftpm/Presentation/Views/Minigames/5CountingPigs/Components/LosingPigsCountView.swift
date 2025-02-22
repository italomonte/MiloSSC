//
//  dwada.swift
//  TypicalABC
//
//  Created by Italo Guilherme Monte on 20/02/25.
//

import SwiftUI
import PencilKit

struct LosingPigsCountView: View {
    
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
                
                Text("It seems like you wrote the wrong number.")
                    .font(.patrickHandBigger)
                    .foregroundStyle(Color.lightBlue)
                    .padding(.bottom)
                
                Text("But don't worry, you can keep trying!")
                    .font(.patrickHandBigger)
                    .foregroundStyle(Color.lightBlue)
                    .padding(.bottom)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                // Try Again Button
                Button {
                    withAnimation {
                        hasDrawn = false
                        canvasView.drawing = .init()
                    }
                    audioManager.sounds.first(where: {$0.filename == .ohNoCounting})?.player?.stop()

                } label: {}
                    .buttonStyle(PressableButtonStyle(normalImage: "TryAgainBtn", pressedImage: "TryAgainBtnPressed", width: 350))
                    .padding(.bottom, 30)
                
            }
        }
        .frame(maxWidth: geo.size.width, maxHeight: calculatePercent(dimensionValue: 828, dimension: .height, geo: geo))
        
        .background(.white)
        .onAppear{
            audioManager.setupAudios(from: .init(filename: [.ohNoCounting], fileExtension: .m4a, volume: 1))
            audioManager.sounds.first(where: {$0.filename == .ohNoCounting})?.player?.play()
        }
    }
}
