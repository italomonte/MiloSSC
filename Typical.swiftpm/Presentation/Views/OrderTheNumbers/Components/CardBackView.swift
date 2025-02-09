//
//  SwiftUIView.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 09/02/25.
//

import SwiftUI

struct CardBackView: View {
    
    let geo: GeometryProxy
    let widthPercent: CGFloat
    @State var isCorret: Bool = false

    var body: some View {
        VStack{
            Image(isCorret ? "correctIndicator" : "incorrectIndicator")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
            
            Image("cardNumberBg")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * widthPercent)

        }
    }
}
