//
//  TextContainer.swift
//  TypicalABC
//
//  Created by Italo Guilherme Monte on 13/02/25.
//
import SwiftUI

struct TextContainer: View {
    
    @ObservedObject var historyPassVm: HistoryPassViewModel
    let geo: GeometryProxy
    
    var body: some View {
        ZStack {
            Image("TextBg")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.9366)
                .padding(.bottom, geo.size.height * 0.03)
            
            HStack {
                
                Button {
                    self.historyPassVm.handleHistoryMoment(movement: .previous)
                } label: {}
                    .buttonStyle(PressableButtonStyle(normalImage: "PassLeftBtn", pressedImage: "PassLeftBtnPressed", width: geo.size.height * 0.06))
                
                Spacer()
                
                Text(historyPassVm.historyTexts[historyPassVm.indexHistoryMoment % historyPassVm.historyTexts.count])
                    .font(.patrickHand)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: 0.75 * geo.size.width)
                    .padding(.bottom)
                
                Spacer()
                
                Button {
                    self.historyPassVm.handleHistoryMoment(movement: .next)
                    
                } label: {}
                    .buttonStyle(PressableButtonStyle(normalImage: "PassRightBtn", pressedImage: "PassRightBtnPressed", width: geo.size.height * 0.06))
            }
            .frame(width: geo.size.width * 0.96)
            
        }
    }
}
