//
//  HistoryPassViewModel.swift
//  TypicalABC
//
//  Created by Italo Guilherme Monte on 12/02/25.
//

import SwiftUI

enum HistoryMovement {
    case next
    case previous
}

struct CardAnimation {
    var frames: [String]
    var framesPerSecond: Int
}

class HistoryPassViewModel: ObservableObject {
    
    
    @Published var indexHistoryStep: Int = 0
    @Published var cardOneStep: Int = 0
    @Published var cardTwoStep: Int = 0
    
    @Published var indexHistoryMoment: Int = 0
    @Published var historyBgMoment: [String] = ["H1_1", "H1_2"]
    @Published var visibleHistoryCards: [Int] = [0 , 1]
    @Published var goToCallMinigames: Bool = false
    @Published var framesPerSecond: Int = 0
    
    init() {
        registerCustomFont()

    }
    
    private var historyBgMoments: [[String]] = [
        ["H1_1", "H1_2"],
        ["H2_1", "H2_2", "H2_3", "H2_4" ],
        ["H3_1"],
        ["H4_1"],
        ["H5_1", "H5_2"],
        ["H6_1"],
    ]
    
    var historyCards: [CardAnimation] = [
        CardAnimation(frames: ["H7-Opera-1", "H7-Opera-2"], framesPerSecond: 1),
        CardAnimation(frames: ["H7-espaco-1",
                               "H7-espaco-2",
                               "H7-espaco-3",
                               "H7-espaco-4",
                               "H7-espaco-5",
                               "H7-espaco-6",
                               "H7-espaco-7",
                               "H7-espaco-8",
                               "H7-espaco-9",
                               "H7-espaco-10",
                               "H7-espaco-11",
                               "H7-espaco-12",
                               "H7-espaco-13",
                               "H7-espaco-14",
                               "H7-espaco-15",
                               "H7-espaco-16",
                               "H7-espaco-17",
                               "H7-espaco-18",
                               "H7-espaco-19",
                               "H7-espaco-20",
                               "H7-espaco-21",
                               "H7-espaco-22",
                               "H7-espaco-23",
                               "H7-espaco-24",
                               "H7-espaco-25",
                               "H7-espaco-26",
                              ], framesPerSecond: 13),
        CardAnimation(frames: ["H8-Monster-1", "H8-Monster-2"], framesPerSecond: 1),
        CardAnimation(frames: ["H8-Wizard-1", "H8-Wizard-2", "H8-Wizard-3", "H8-Wizard-4"], framesPerSecond: 1),
    ]
    
    let historyTexts: [String] = [
        "Once upon a time there was a little boy named Charlie. Curious and shy, he lived in a noisy and boring world.",
        "Every day Charlie went to school. He tried to participate in class, but the words in the books seemed to dance in front of him. He felt lost when the other students answered questions quickly, while he needed more time to process.",
        "Until one day the teacher brought him a book with several drawings and magical colors. Charlie didn't understand those strange letters, but he could understand the stories through the pictures.",
        "Because of this Charlie fell in love with books. With them, Charlie could explore different worlds and be whoever he wanted to be.",
        "He could be an explorer of distant kingdoms, exploring castles and discovering exotic animals...",
        "He could be an opera singer, or even an astronaut.",
        "He could be a wizard and know magical creatures",
        "Because of this Charlie became curious to understand what those strange letters in the books meant. So determined, he started to study through games. That way, he had fun and did well in school.",
        "Until finally after playing several times with his parents, Charlie could now understand those confusing letters. And from that day on, Charlie started reading several and several books, so the world was no longer boring, after all, now he could explore other worlds whenever he wanted through books."
        
    ]
    
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

    // Chamar a função para registrar a fonte
    
    func handleHistoryMoment(movement: HistoryMovement) {
        if movement == .next {
            indexHistoryMoment += 1
            indexHistoryStep = 0

            if indexHistoryMoment <= 5 {
                print("change bg")
                historyBgMoment = historyBgMoments[indexHistoryMoment % historyBgMoments.count]

            } else if indexHistoryMoment >= 6 { // muda os primeiros cards para os proximos
                cardOneStep = 0
                cardTwoStep = 0
                visibleHistoryCards = [2, 3]
            }
            
            if indexHistoryMoment == 9 { // muda cards secundários para a CTAView
                goToCallMinigames.toggle()
            }
            
        } else if movement == .previous && indexHistoryMoment > 0 {
            indexHistoryStep = 0
            indexHistoryMoment -= 1
            print(indexHistoryMoment)
            
            if indexHistoryMoment == 5 { // segundos cards
                cardOneStep = 0
                cardTwoStep = 0
                visibleHistoryCards = [0, 1]
            }
            
            if indexHistoryMoment <= 5{
                historyBgMoment = historyBgMoments[indexHistoryMoment % historyBgMoments.count]
            }

        }
    }
    
}


