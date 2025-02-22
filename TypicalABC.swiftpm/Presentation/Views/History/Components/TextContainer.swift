import SwiftUI

struct TextContainer: View {
    
    @ObservedObject var historyPassVm: HistoryPassViewModel

    let geo: GeometryProxy
    
    @State private var soundVolume = 1
    @State private var isPlayingSound = false
    @State private var timerImage: Timer?
    @State private var timerAudio: Timer?
    
    func startAudioLoop() {
        stopAudioLoop() // Garante que não há múltiplos Timers rodando
        isPlayingSound = true
        startImageLoop()
        
        let duration = historyPassVm.voiceSeconds[historyPassVm.indexHistoryMoment]
        
        timerAudio = Timer.scheduledTimer(withTimeInterval: TimeInterval(duration), repeats: false) { _ in
            stopAudioLoop()
            print("Timer off")
        }
    }
    
    func stopAudioLoop() {
        timerAudio?.invalidate()
        timerAudio = nil
        isPlayingSound = false
        soundVolume = 1
    }
    
    func startImageLoop() {
        stopImageLoop()
        
        timerImage = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
            soundVolume = (soundVolume + 1) % 3
        }
    }
    
    func stopImageLoop() {
        timerImage?.invalidate()
        timerImage = nil
        soundVolume = 1 // Ícone volta ao estado original
    }
    
    var body: some View {
        ZStack {
            
            Image("TextBg")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.9366)
                .padding(.bottom, geo.size.height * 0.03)
            
            HStack {
                
                // Previous
                Button {
                    historyPassVm.historyVoice[historyPassVm.indexHistoryMoment]?.stop()
                    stopAudioLoop()
                    historyPassVm.handleHistoryMoment(movement: .previous)
                } label: {}
                    .buttonStyle(PressableButtonStyle(normalImage: historyPassVm.indexHistoryMoment == 0 ? "PassLeftBtnDisabled" : "PassLeftBtn", pressedImage: historyPassVm.indexHistoryMoment == 0 ? "PassLeftBtnDisabled" : "PassLeftBtnPressed", width: geo.size.height * 0.06))
                
                Spacer()
        
                HStack{
                    // Sound
                    Image(isPlayingSound ? "soundBtn\(soundVolume)" : "soundBtn2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: calculatePercent(dimensionValue: 110, dimension: .width, geo: geo))
                        .onTapGesture {
                            if isPlayingSound {
                                historyPassVm.historyVoice[historyPassVm.indexHistoryMoment]?.stop()
                                stopAudioLoop()
                            } else {
                                historyPassVm.historyVoice[historyPassVm.indexHistoryMoment]?.play()
                                startAudioLoop()
                            }
                        }
                    
                    // Text
                    Text(historyPassVm.historyTexts[historyPassVm.indexHistoryMoment % historyPassVm.historyTexts.count])
                        .font(.patrickHand)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: 0.75 * geo.size.width)
                        .padding(.bottom)
                        .foregroundStyle(Color.darkBrown)
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Next
                Button {
                    historyPassVm.historyVoice[historyPassVm.indexHistoryMoment]?.stop()
                    stopAudioLoop()
                    self.historyPassVm.handleHistoryMoment(movement: .next)
                    
                } label: {}
                    .buttonStyle(PressableButtonStyle(normalImage: "PassRightBtn", pressedImage: "PassRightBtnPressed", width: geo.size.height * 0.06))
            }
            .frame(width: geo.size.width * 0.96)
        }
        .onReceive(NotificationCenter.default.publisher(for: .audioDidFinish)) { _ in
            stopAudioLoop()
        }
    }
}
