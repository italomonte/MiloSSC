//
//  SwiftUIView.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 09/02/25.
//

import SwiftUI

struct CardBackView: View {
    
    @State var isCorret: Bool = false
    var width: CGFloat

    var body: some View {
        VStack{
            Image(isCorret ? "correctIndicator" : "incorrectIndicator")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
            
            Image("cardNumberBg")
                .resizable()
                .scaledToFit()
                .frame(width: width)

        }
    }
}


#Preview {
    CardBackView(isCorret: false, width: 100)
}
