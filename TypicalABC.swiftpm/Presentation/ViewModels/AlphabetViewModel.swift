//
//  OrderTheNumbersViewModel.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 09/02/25.
//

import SwiftUI
import PencilKit

struct LetterInfo: Identifiable {
    let id: Int
    let widthPercent: CGFloat
    let offset: CGSize
    let directionPercent: CGFloat
    let directionOffset: CGFloat
    var done: Bool
    var drawning: PKDrawing
}

class AlphabetViewModel: ObservableObject {
    
    @Published  var soundVolume = 1
    @Published  var isPlayingSound = false
    @Published  var isPlayingNarration = false
    @Published  var timerImage: Timer?
    @Published  var timerAudio: Timer?
    
    @Published var alphabet: [LetterInfo] = [
        LetterInfo(id: 65, widthPercent: 705, offset: .init(width: 0, height: 12), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 66, widthPercent: 552, offset: .init(width: 0, height: -8), directionPercent: 450, directionOffset: -10, done: false, drawning: PKDrawing()),
        LetterInfo(id: 67, widthPercent: 640, offset: .init(width: -4, height: -6), directionPercent: 500, directionOffset: 0, done: false, drawning: PKDrawing()),
        LetterInfo(id: 68, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 69, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 70, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 71, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 72, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 73, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 74, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 75, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 76, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 77, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 78, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 79, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 80, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 81, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 82, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 83, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 84, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 85, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 86, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 87, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 88, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 89, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing()),
        LetterInfo(id: 90, widthPercent: 705, offset: .init(width: 12, height: 0), directionPercent: 500, directionOffset: 20, done: false, drawning: PKDrawing())
    ]
}
