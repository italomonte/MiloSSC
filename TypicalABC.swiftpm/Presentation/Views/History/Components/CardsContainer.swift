//
//  CardsContainer.swift
//  TypicalABC
//
//  Created by Italo Guilherme Monte on 13/02/25.
//

import SwiftUI

struct CardsContainer: View {
    
    let geo: GeometryProxy
    @ObservedObject var historyPassVm: HistoryPassViewModel
    
    var body: some View {
        
        VStack{
            HStack {
                
                ImageLoop(
                    assets:$historyPassVm.historyCards[historyPassVm.visibleHistoryCards[0]].frames,
                    indexHistoryStep: $historyPassVm.cardOneStep,
                    framesPerSecond: $historyPassVm.historyCards[historyPassVm.visibleHistoryCards[0]].framesPerSecond,
                    contentMode: .fit)
                .frame(width: geo.size.width * 0.35)
                .mask {
                    RoundedRectangle(cornerRadius: 36)
                        .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.68)
                    
                }
                .overlay {
                    Image("history-border")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.69)
                }
                
                
                
                Spacer()
                
                ImageLoop(assets: $historyPassVm.historyCards[historyPassVm.visibleHistoryCards[1]].frames, indexHistoryStep: $historyPassVm.cardTwoStep,
                          framesPerSecond: $historyPassVm.historyCards[historyPassVm.visibleHistoryCards[1]].framesPerSecond,
                          contentMode: .fit)
                
                .frame(width: geo.size.width * 0.35)
                .mask {
                    RoundedRectangle(cornerRadius: 36)
                        .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.68)
                }
                .overlay {
                    Image("history-border")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.69)
                }
                
            }
            .frame(maxWidth: geo.size.width * 0.74)
            Spacer()
        }
        .frame(maxHeight: geo.size.height * 0.935)
    }
}
