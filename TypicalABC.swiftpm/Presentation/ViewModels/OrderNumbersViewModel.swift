
import SwiftUI

class OrderNumbersViewModel: ObservableObject {
    
    @Published var numbersCards: [NumberCard]
    
    @Published  var soundVolume = 1
    @Published  var isPlayingSound = false
    @Published  var isPlayingNarration = false
    @Published  var timerImage: Timer?
    @Published  var timerAudio: Timer?
    
    init() {
        
        func getHeightPercent(for height: CGFloat) -> CGFloat {
            return height / 1620
        }
        
        self.numbersCards = [
            NumberCard(id: 0, heigthPercent: getHeightPercent(for: 471 - 87)),
            NumberCard(id: 1, heigthPercent: getHeightPercent(for: 544 - 87)),
            NumberCard(id: 2, heigthPercent: getHeightPercent(for: 620 - 87)),
            NumberCard(id: 3, heigthPercent: getHeightPercent(for: 679 - 87)),
            NumberCard(id: 4, heigthPercent: getHeightPercent(for: 767 - 87)),
            NumberCard(id: 5, heigthPercent: getHeightPercent(for: 842 - 87)),
            NumberCard(id: 6, heigthPercent: getHeightPercent(for: 917 - 87)),
            NumberCard(id: 7, heigthPercent: getHeightPercent(for: 992 - 87)),
            NumberCard(id: 8, heigthPercent: getHeightPercent(for: 1065 - 87)),
            NumberCard(id: 9, heigthPercent: getHeightPercent(for: 1137 - 87)),
        ].shuffled()
        
    }
    
    func isOrdered() -> Bool {
        let isOrdered = true
        for numbersCard in numbersCards {
            if numbersCard.id != numbersCards.firstIndex(of: numbersCard)! {
                return false
            }
        }
        return isOrdered
    }
    
    func shuffleCards() {
        self.numbersCards = self.numbersCards.shuffled()
    }
    
}
