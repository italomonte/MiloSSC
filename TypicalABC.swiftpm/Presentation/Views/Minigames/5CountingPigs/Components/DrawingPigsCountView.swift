//
//  DrawingPigsCountView.swift
//  TypicalABC
//
//  Created by Italo Guilherme Monte on 20/02/25.
//

import SwiftUI
import PencilKit

struct DrawingPigsCountView: View {
    
    let geo: GeometryProxy
    @ObservedObject var countingPigsVm: CountingPigsViewModel
    @Binding var isMinimizeModal: Bool
    @EnvironmentObject var audioManager: AudioManager

    var body: some View {
        ZStack {
            
            Image("pigsBg")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: geo.size.width, maxHeight: calculatePercent(dimensionValue: 739, dimension: .height, geo: geo))
            
            VStack {
                
                Image("modalBar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: calculatePercent(dimensionValue: 72, dimension: .width, geo: geo))
                    .padding(.vertical)
                    .gesture (
                        DragGesture()
                            .onChanged { value in
                                if value.translation.height > 100 {
                                    withAnimation {
                                        isMinimizeModal = true
                                    }
                                } else if value.translation.height < 100 {
                                    withAnimation {
                                        isMinimizeModal = false

                                    }
                                }
                            }
                    )
                
                soundButton
                
                Text("How many pigs do you see?")
                    .font(.patrickHandBigger)
                    .foregroundStyle(Color.lightBlue)
                    .padding(.bottom)
                
                ZStack{
                    
                    Image("pencilBg")
                        .resizable()
                        .scaledToFit()
                        .frame(width: calculatePercent(dimensionValue: 405, dimension: .width, geo: geo))
                        .allowsHitTesting(false)
                    
                    PencilKitNumberView(countingPigsVm: countingPigsVm)
                        .frame(width: calculatePercent(dimensionValue: 405, dimension: .width, geo: geo),
                               height:
                                calculatePercent(dimensionValue: 405, dimension: .height, geo: geo)
                        )
                        .onAppear {
                            print("height: \(calculatePercent(dimensionValue: 405, dimension: .height, geo: geo))")
                            print("width: \(calculatePercent(dimensionValue: 405, dimension: .width, geo: geo))")
                        }
                    
                }
                .padding(.bottom, calculatePercent(dimensionValue: 50, dimension: .height, geo: geo))
            }

        }
        .frame(maxWidth: geo.size.width, maxHeight: calculatePercent(dimensionValue: 739, dimension: .height, geo: geo))
        .background(.white)

    }
    
    
    private var soundButton: some View {
        Image(countingPigsVm.isPlayingSound ? "soundBtn\(countingPigsVm.soundVolume)" : "soundBtn2")
            .resizable()
            .scaledToFit()
            .frame(width: UIScreen.main.bounds.width * 0.05)
            .onTapGesture { toggleSound() }
    }
    
    private func toggleSound() {
        if countingPigsVm.isPlayingSound {
            stopCurrentAudio()
        } else {
            playCurrentAudio()
        }
    }
    
    
    private func playCurrentAudio() {
        audioManager.sounds.first(where: { $0.filename == .promptCounting })?.player?.play()
        startAudioLoop()
    }
    
    private func stopCurrentAudio() {
        audioManager.sounds.first(where: { $0.filename == .promptCounting })?.player?.stop()
        stopAudioLoop()
    }
    
    private func startAudioLoop() {
        stopAudioLoop()
        countingPigsVm.isPlayingSound = true
        startImageLoop()
        countingPigsVm.timerAudio = Timer.scheduledTimer(withTimeInterval: TimeInterval(4), repeats: false) { _ in
            stopAudioLoop()
        }
    }
    
    private func stopAudioLoop() {
        countingPigsVm.timerAudio?.invalidate()
        countingPigsVm.timerAudio = nil
        countingPigsVm.isPlayingSound = false
        countingPigsVm.soundVolume = 1
    }
    
    private func startImageLoop() {
        stopImageLoop()
        countingPigsVm.timerImage = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
            countingPigsVm.soundVolume = (countingPigsVm.soundVolume + 1) % 3
        }
    }
    
    private func stopImageLoop() {
        countingPigsVm.timerImage?.invalidate()
        countingPigsVm.timerImage = nil
        countingPigsVm.soundVolume = 1
    }
    
}
