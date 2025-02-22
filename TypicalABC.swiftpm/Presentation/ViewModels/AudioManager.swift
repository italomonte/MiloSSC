//
//  AudioManager.swift
//  TypicalABC
//
//  Created by Italo Guilherme Monte on 21/02/25.
//

import AVFoundation

enum AudioFile: String, CaseIterable {
    
    case Soundtrack = "Soundtrack"
    case GenericFeedback = "GenericFeedback"
    case OhNoCounting = "OhNoCounting"
    case PromptAlphabet = "PromptAlphabet"
    case PromptCounting = "PromptCounting"
    case PromptFluffies = "PromptFluffies"
    case VictoryCounting = "VictoryCounting"
    case VictoryFluffies = "VictoryFluffies"
    case WinningFeedback = "WinningFeedback"
    
}

class AudioManager: NSObject, ObservableObject, AVAudioPlayerDelegate{
    
    let voiceSeconds = [9, 16, 13, 9, 7, 4, 15, 22, 22]
    var historyVoice: [AVAudioPlayer?] = []
    
    
    var genericAudios: [(name: AudioFile, player: AVAudioPlayer?)] = []
    

    
    func setupAudios() {
        for audioName in AudioFile.allCases {
            setupGenericAudio(audioFilename: audioName)
        }
    }
    
    func setupHistoryVoices(index: Int) {
        if let soundURL = Bundle.main.url(forResource: "H" + String(index), withExtension: "m4a") {
            do {
                let audio = try AVAudioPlayer(contentsOf: soundURL)
                audio.delegate = self
                audio.prepareToPlay()
                
                historyVoice.append(audio)
            } catch {
                print("Erro ao carregar o áudio: \(error.localizedDescription)")
            }
        }
    }
    
    func setupGenericAudio(audioFilename: AudioFile) {
        
        if let soundURL = Bundle.main.url(forResource: audioFilename.rawValue, withExtension: "m4a") {
            do {
                let audio = try AVAudioPlayer(contentsOf: soundURL)
                audio.delegate = self
                audio.prepareToPlay()
                genericAudios.append((name: audioFilename, player: audio))
                
            } catch {
                print("Erro ao carregar o áudio \(audioFilename.rawValue): \(error.localizedDescription)")
            }
        }
    }
    
    // Função chamada quando o áudio termina
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .audioDidFinish, object: nil)
        }
    }
    
}


// Notificação para detectar quando o áudio termina
extension Notification.Name {
    static let audioDidFinish = Notification.Name("audioDidFinish")
}
