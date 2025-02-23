import SwiftUI
import PencilKit

struct DrawingPigsCountView: View {
    
    @EnvironmentObject var audioManager: AudioManager
    
    let geo: GeometryProxy
    @ObservedObject var countingPigsVm: CountingPigsViewModel
    @Binding var isMinimizeModal: Bool

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
                
                SoundButton(widthPercent: 0.5, countingPigsVm: countingPigsVm)
                                    
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
        .frame(maxWidth: geo.size.width, minHeight: calculatePercent(dimensionValue: 739, dimension: .height, geo: geo))
        .background(.white)

    }

}


struct SoundButton: View {
    
    @EnvironmentObject var audioManager: AudioManager
    let widthPercent: CGFloat

    @ObservedObject var countingPigsVm: CountingPigsViewModel
    
    var body: some View{
        Image("soundBtnBlue")
            .resizable()
            .scaledToFit()
             .onTapGesture { toggleSound() }
             .frame(width: UIScreen.main.bounds.width * 0.05)
    }
    
    func toggleSound() {
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
