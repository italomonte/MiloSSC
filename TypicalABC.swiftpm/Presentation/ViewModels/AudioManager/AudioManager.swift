//
//  AudioManager.swift
//  TypicalABC
//
//  Created by Italo Guilherme Monte on 22/02/25.
//

import AVFoundation

class AudioManager: NSObject, ObservableObject, AVAudioPlayerDelegate {
    
    var sounds: [Audio] = []
    
    func setupAudios(from audio: AudioDTO) {
        
        for fileName in audio.filename {
            if let soundURL = Bundle.main.url(forResource: fileName.rawValue, withExtension: audio.fileExtension.rawValue) {
                do {
                    let audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                    audioPlayer.delegate = self
                    audioPlayer.volume = audio.volume
                    audioPlayer.numberOfLoops = fileName == .soundtrack ? -1 : 0
                    audioPlayer.prepareToPlay()
                    sounds.append(Audio(filename: fileName, fileExtension: audio.fileExtension, player: audioPlayer))
                    
                } catch {
                    print("Erro ao carregar o áudio \(fileName.rawValue): \(error.localizedDescription)")
                }
            }
        }
    }
    
    
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .audioDidFinish, object: nil)
        }
    }
    
    
    

}


extension Notification.Name {
    static let audioDidFinish = Notification.Name("audioDidFinish")
}

