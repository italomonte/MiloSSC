import SwiftUI

struct TextContainer: View {
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var settingsManager: SettingsManager
    
    @ObservedObject var historyPassVm: HistoryPassViewModel
    
    let geo: GeometryProxy
    

    
    var body: some View {
        ZStack {
            backgroundImage
            navigationControls
        }
        .onReceive(NotificationCenter.default.publisher(for: .audioDidFinish)) { _ in
            stopAudioLoop()
        }
    }
    
    private var backgroundImage: some View {
        Image("TextBg")
            .resizable()
            .scaledToFit()
            .frame(width: geo.size.width * 0.9366)
            .padding(.bottom, geo.size.height * 0.03)
    }
    
    private var navigationControls: some View {
        HStack {
            previousButton
            Spacer()
            contentSection
            Spacer()
            nextButton
        }
        .frame(width: geo.size.width * 0.96)
    }
    
    private var previousButton: some View {
        Button {
            stopCurrentAudio()
            historyPassVm.handleHistoryMoment(movement: .previous)
            if settingsManager.soundEffectsEnable {
                audioManager.sounds.first(where: {$0.filename == .genericFeedback})?.player?.play()
            }

        } label: {}
        .buttonStyle(PressableButtonStyle(
            normalImage: historyPassVm.indexHistoryMoment == 0 ? "PassLeftBtnDisabled" : "PassLeftBtn",
            pressedImage: historyPassVm.indexHistoryMoment == 0 ? "PassLeftBtnDisabled" : "PassLeftBtnPressed",
            width: geo.size.height * 0.06
        ))
    }
    
    private var nextButton: some View {
        Button {
            stopCurrentAudio()
            historyPassVm.handleHistoryMoment(movement: .next)
            if settingsManager.soundEffectsEnable {
                audioManager.sounds.first(where: {$0.filename == .genericFeedback})?.player?.play()
            }
        } label: {}
        .buttonStyle(PressableButtonStyle(
            normalImage: "PassRightBtn",
            pressedImage: "PassRightBtnPressed",
            width: geo.size.height * 0.06
        ))
    }
    
    private var contentSection: some View {
        HStack {
            soundButton
            textDisplay
        }
        .padding(.horizontal)
    }
    
    private var soundButton: some View {
        Image(historyPassVm.isPlayingSound ? "soundBtn\(historyPassVm.soundVolume)" : "soundBtn2")
            .resizable()
            .scaledToFit()
            .frame(width: calculatePercent(dimensionValue: 110, dimension: .width, geo: geo))
            .onTapGesture { toggleSound() }
    }
    
    private func toggleSound() {
        if historyPassVm.isPlayingSound {
            stopCurrentAudio()
        } else {
            playCurrentAudio()
        }
    }
    
    
    private func playCurrentAudio() {
        audioManager.sounds.first(where: { $0.filename.rawValue == "H\(historyPassVm.indexHistoryMoment + 1)" })?.player?.play()
        startAudioLoop()
    }
    
    private func stopCurrentAudio() {
        audioManager.sounds.first(where: { $0.filename.rawValue == "H\(historyPassVm.indexHistoryMoment + 1)" })?.player?.stop()
        stopAudioLoop()
    }
    
    
    private var textDisplay: some View {
        Text(historyPassVm.historyTexts[historyPassVm.indexHistoryMoment % historyPassVm.historyTexts.count])
            .font(.patrickHand)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: 0.75 * geo.size.width)
            .padding(.bottom)
            .foregroundStyle(Color.darkBrown)
    }


    private func startAudioLoop() {
        stopAudioLoop()
        historyPassVm.isPlayingSound = true
        startImageLoop()
        let duration = historyPassVm.voiceSeconds[historyPassVm.indexHistoryMoment]
        historyPassVm.timerAudio = Timer.scheduledTimer(withTimeInterval: TimeInterval(duration), repeats: false) { _ in
            stopAudioLoop()
        }
    }
    
    private func stopAudioLoop() {
        historyPassVm.timerAudio?.invalidate()
        historyPassVm.timerAudio = nil
        historyPassVm.isPlayingSound = false
        historyPassVm.soundVolume = 1
    }
    
    private func startImageLoop() {
        stopImageLoop()
        historyPassVm.timerImage = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
            historyPassVm.soundVolume = (historyPassVm.soundVolume + 1) % 3
        }
    }
    
    private func stopImageLoop() {
        historyPassVm.timerImage?.invalidate()
        historyPassVm.timerImage = nil
        historyPassVm.soundVolume = 1
    }
}
