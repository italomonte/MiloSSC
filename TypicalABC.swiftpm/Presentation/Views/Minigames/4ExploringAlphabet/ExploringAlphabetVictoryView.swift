import SwiftUI

struct ExploringAlphabetVictoryView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var audioManager: AudioManager
    @EnvironmentObject var settingsManager: SettingsManager

    
    @State var isSettingOpen = false

    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                
                Image("alphabetBg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                Image("symbolsBgAlphabet")
                    .resizable()
                    .scaledToFit()
                    .frame(width: calculatePercent(dimensionValue: 1900, dimension: .width, geo: geo))
                    .offset(y: calculatePercent(dimensionValue: -100, dimension: .height, geo: geo))
                
                
                VStack(spacing: 20) {
                    Image("youDidIt")
                        .resizable()
                        .scaledToFit()
                        .frame(width: calculatePercent(dimensionValue: 980, dimension: .width, geo: geo))
                        .padding(.bottom)
                    
                    Text("You managed to draw all the alphabet letters.")
                        .font(.patrickHandExtremeBigger)
                        .frame(maxWidth: calculatePercent(dimensionValue: 1000, dimension: .width, geo: geo))
                        .multilineTextAlignment(.center)
                    
                    Text("Knowing how to write and identify letters is very important for reading—keep practicing and having fun!")
                        .font(.patrickHandExtremeBigger)
                        .frame(maxWidth: calculatePercent(dimensionValue: 1026, dimension: .width, geo: geo))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, calculatePercent(dimensionValue: 30, dimension: .height, geo: geo))

                    // Try Again Button
                    Button {
                        dismiss()
                        audioManager.sounds.first(where: {$0.filename == .victoryAlphabet})?.player?.stop()

                    } label: {}
                        .buttonStyle(PressableButtonStyle(normalImage: "KeepPlayingBtn", pressedImage: "KeepPlayingBtnPressed", width: 350))
                        .padding(.top, 30)
                }
                .foregroundStyle(.white)

                
                
                
                // UI
                UIButtons(buttons: [
                    ("SettingsBtn", {isSettingOpen = true})
                ], geo: geo)
                
                
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            audioManager.setupAudios(from: .init(filename: [.winningFeedback], fileExtension: .wav, volume: 1))
            audioManager.setupAudios(from: .init(filename: [.victoryAlphabet], fileExtension: .m4a, volume: 1))
            if settingsManager.soundEffectsEnable {
                audioManager.sounds.first(where: {$0.filename == .winningFeedback})?.player?.play()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                audioManager.sounds.first(where: {$0.filename == .victoryAlphabet})?.player?.play()
            }
        }
        
    }
    
}
