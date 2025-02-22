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
    @ObservedObject var countingPigsVm: CountingPigsViewModel
    @Binding var isMinimizeModal: Bool
    
    var body: some View {
        ZStack {
            
            Image("pigsBg")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: geo.size.width, maxHeight: calculatePercent(dimensionValue: 739, dimension: .height, geo: geo))
            
            VStack {
                
                Image("modalBar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: calculatePercent(dimensionValue: 72, dimension: .width, geo: geo))
                    .padding(.vertical)
                    .gesture (
                        DragGesture()
                            .onChanged { value in
                                if value.translation.height > 100 {
                                    withAnimation {
                                        isMinimizeModal = true
                                    }
                                } else if value.translation.height < 100 {
                                    withAnimation {
                                        isMinimizeModal = false

                                    }
                                }
                            }
                    )
                
                
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
                    
                    PencilKitNumberView(countingPigsVm: countingPigsVm)
                        .frame(width: calculatePercent(dimensionValue: 405, dimension: .width, geo: geo),
                               height:
                                calculatePercent(dimensionValue: 405, dimension: .height, geo: geo)
                        )
                        .onAppear {
                            print("height: \(calculatePercent(dimensionValue: 405, dimension: .height, geo: geo))")
                            print("width: \(calculatePercent(dimensionValue: 405, dimension: .width, geo: geo))")
                        }
                    
                }
                .padding(.bottom, calculatePercent(dimensionValue: 50, dimension: .height, geo: geo))
            }

        }
        .frame(maxWidth: geo.size.width, maxHeight: calculatePercent(dimensionValue: 739, dimension: .height, geo: geo))
        .background(.white)

    }
}
