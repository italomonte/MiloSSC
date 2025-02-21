//
//  DrawingPigsCountView.swift
//  TypicalABC
//
//  Created by Italo Guilherme Monte on 20/02/25.
//

import SwiftUI
import PencilKit

struct DrawingPigsCountView: View {
    
    let geo: GeometryProxy
    @Binding var canvasView: PKCanvasView
    
    var body: some View {
        ZStack {
            
            Image("pigsBg")
                .resizable()
                .scaledToFit()
            
            VStack {
                
                Image("modalBar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: calculatePercent(dimensionValue: 72, dimension: .width, geo: geo))
                    .padding(.top, calculatePercent(dimensionValue: 48, dimension: .height, geo: geo))
                
                Spacer()
                
                Text("How many pigs do you see?")
                    .font(.patrickHandBigger)
                    .foregroundStyle(Color.lightBlue)
                    .padding(.bottom)
                
                ZStack{
                    
                    Image("pencilBg")
                        .resizable()
                        .scaledToFit()
                        .frame(width: calculatePercent(dimensionValue: 405, dimension: .width, geo: geo))
                        .allowsHitTesting(false)
                    
                    PencilKitNumberView(canvasView: $canvasView)
                        .frame(width: calculatePercent(dimensionValue: 405, dimension: .width, geo: geo),
                               height:
                                calculatePercent(dimensionValue: 405, dimension: .height, geo: geo)
                        )
                }
                .padding(.bottom, calculatePercent(dimensionValue: 50, dimension: .height, geo: geo))
            }
        }
        .frame(maxWidth: geo.size.width, maxHeight: calculatePercent(dimensionValue: 739, dimension: .height, geo: geo))
        .background(.white)


    }
}
