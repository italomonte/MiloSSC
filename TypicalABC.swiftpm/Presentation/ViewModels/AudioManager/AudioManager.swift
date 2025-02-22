//
//  AudioManager.swift
//  TypicalABC
//
//  Created by Italo Guilherme Monte on 22/02/25.
//

import AVFoundation

class AudioManager: NSObject, ObservableObject, AVAudioPlayerDelegate {
    
    var sounds: [Audio] = []
    
    func setupAudio(from audio: AudioDTO) {
        if let soundURL = Bundle.main.url(forResource: audio.filename.rawValue, withExtension: audio.fileExtension.rawValue) {
            do {
                let audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer.delegate = self
                audioPlayer.volume = audio.volume
                audioPlayer.prepareToPlay()
                sounds.append(Audio(filename: audio.filename, fileExtension: audio.fileExtension, player: audioPlayer))
                
            } catch {
                print("Erro ao carregar o áudio \(audio.filename.rawValue): \(error.localizedDescription)")
            }
            
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: .audioDidFinish, object: nil)
        }
    }
    
}
