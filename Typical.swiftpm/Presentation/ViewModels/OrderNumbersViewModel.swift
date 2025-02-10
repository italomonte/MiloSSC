//
//  OrderTheNumbersViewModel.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 09/02/25.
//

import SwiftUI

class OrderNumbersViewModel: ObservableObject {
    
    @Published var numbersCards: [NumberCard]
    
    init() {
        
        func getHeightPercent(for height: CGFloat) -> CGFloat {
            return height / 1620
        }
        
        self.numbersCards = [
            NumberCard(id: 0, heigthPercent: getHeightPercent(for: 471)),
            NumberCard(id: 1, heigthPercent: getHeightPercent(for: 544)),
            NumberCard(id: 2, heigthPercent: getHeightPercent(for: 620)),
            NumberCard(id: 3, heigthPercent: getHeightPercent(for: 679)),
            NumberCard(id: 4, heigthPercent: getHeightPercent(for: 767)),
            NumberCard(id: 5, heigthPercent: getHeightPercent(for: 842)),
            NumberCard(id: 6, heigthPercent: getHeightPercent(for: 917)),
            NumberCard(id: 7, heigthPercent: getHeightPercent(for: 992)),
            NumberCard(id: 8, heigthPercent: getHeightPercent(for: 1065)),
            NumberCard(id: 9, heigthPercent: getHeightPercent(for: 1137)),
        ].shuffled()
        
    }
    
    
}
