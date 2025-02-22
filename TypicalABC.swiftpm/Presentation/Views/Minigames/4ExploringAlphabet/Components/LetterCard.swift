//
//  LetterCard.swift
//  TypicalABC
//
//  Created by Italo Guilherme Monte on 17/02/25.
//

import SwiftUI

struct LetterCard: View {
    
    var letter: LetterInfo
    let geo: GeometryProxy
    @Binding var letterSelected: Int
    
    var body: some View {
        ZStack{
            Image(letter.id == letterSelected ? "letterSelectBg" : "lettersBg")
                .resizable()
                .scaledToFit()
                .frame(
                    width: calculatePercent(dimensionValue: letter.id == letterSelected ? 195 : 175, dimension: .width, geo: geo)
                )
            
            Text(String(UnicodeScalar(letter.id) ?? "A"))
                .font(.system(size: calculatePercent(dimensionValue: 150, dimension: .width, geo: geo), weight: .bold, design: .default))
                .fontDesign(.rounded)
                .foregroundStyle(letter.done ? Color.mediumGreen : Color.lightGreen)
            
            Color.gray
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(
                    width: calculatePercent(dimensionValue: 175, dimension: .width, geo: geo),
                    height: calculatePercent(dimensionValue: 205, dimension: .width, geo: geo)
                )
                .opacity((letter.id >= 68) ? 0.4 : 0)
            
        }

    }
}
