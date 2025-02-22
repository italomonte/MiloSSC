import SwiftUI
import AVFoundation


struct InitialMenuView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var audioManager: AudioManager
    
    @Environment(\.dismiss) var dismiss
    
//    @ObservedObject var initialMenuVm: InitialMenuViewModel = .init()
    
    @State private var images = ["InitialBg1", "InitialBg2"]
    @State private var indexMenuStep = 0
    @State private var bgFramesPerSecond = 1
    @State var isSettingOpen = false
    
    func registerCustomFont() {
        guard let fontURL = Bundle.main.url(forResource: "PatrickHand-Regular", withExtension: "ttf"),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Erro ao carregar a fonte")
        }
        
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            print("Erro ao registrar a fonte: \(error!.takeRetainedValue())")
        }
    }
    
    init() {
        print("instanciado")
        registerCustomFont()
    }
    
    var body: some View {
        
        
        NavigationStack{
            GeometryReader{ geo in
                ZStack {
                    
                    ImageLoop(assets: Binding(get: {
                        self.images
                    }, set: { value  in
                        self.images = value
                    }), indexHistoryStep: Binding(get: {
                        self.indexMenuStep
                    }, set: { value  in
                        self.indexMenuStep = value
                    }), framesPerSecond: $bgFramesPerSecond, contentMode: .fill)
                    .ignoresSafeArea()
                    
                    
                    // UI Button Settings
                    UIButtons(buttons: [
                        ("InfoBtn", {
                            coordinator.push(page: .InfoView)
                            audioManager.sounds.first(where: {$0.filename == .genericFeedback})?.player?.play()
                        }),
                        ("SettingsBtn", {
                            isSettingOpen = true
                            audioManager.sounds.first(where: {$0.filename == .genericFeedback})?.player?.play()
                            
                        }),
                    ], geo: geo)
                    .padding(.vertical)
                    
                    VStack {
                        
                        Spacer()
                        
                        Button {
                            audioManager.sounds.first(where: {$0.filename == .genericFeedback})?.player?.play()
                            coordinator.push(page: .HistoryPassView)
                            
                        } label: {}
                            .buttonStyle(PressableButtonStyle(normalImage: "PlayBtn", pressedImage: "PlayBtnPressed", width: calculatePercent(dimensionValue: 276, dimension: .width, geo: geo)))
                        
                    }
                    .padding(.bottom, calculatePercent(dimensionValue: 150, dimension: .height, geo: geo))
                }
            }
        }
        .onAppear{
            audioManager.sounds.first(where: {$0.filename == .soundtrack})?.player?.play()
            
        }
        .onAppear{
            audioManager.setupAudio(from: .init(filename: .genericFeedback, fileExtension: .wav, volume: 1))
            audioManager.setupAudio(from: .init(filename: .soundtrack, fileExtension: .mp3, volume: 0.5))
        }
    }
    

}

#Preview {
    InitialMenu()
}
//
//class InitialMenuViewModel: NSObject, ObservableObject, AVAudioPlayerDelegate {
//    
//    @Published var sounds: [AVAudioPlayer?] = []
//    
//    func setupAudios(fileNames: [(String, String)]) {
//        for name in fileNames {
//            if let soundURL = Bundle.main.url(forResource: name.0, withExtension: name.1) {
//                do {
//                    let audio = try AVAudioPlayer(contentsOf: soundURL)
//                    audio.delegate = self
//                    audio.prepareToPlay()
//                    audio.volume = 0.1
//                    sounds.append(audio)
//                    
//                } catch {
//                    print("Erro ao carregar o áudio \(name): \(error.localizedDescription)")
//                }
//            }
//            
//            print(sounds)
//        }
//        
//        
//    }
//    
//    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
//        DispatchQueue.main.async {
//            NotificationCenter.default.post(name: .audioDidFinish, object: nil)
//        }
//    }
//}
