//
//  SwiftUIView.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 08/02/25.
//

import SwiftUI

struct ImageLoop: View {
    
    @Binding var assets: [String]
    @Binding var indexHistoryStep: Int
    @State private var timer: Timer?
    var framesPerSecond: Int
    var contentMode: ContentMode
    //    var width: CGFloat
    
    func calculateIntervalToTimer() -> Double {
        return 1.0/Double(framesPerSecond)
    }
    
    var body: some View {
        Image(assets[indexHistoryStep])
            .resizable()
            .aspectRatio(contentMode: contentMode)
        //            .frame(maxWidth: width)
            .onAppear {
                startImageLoop()
            }
            .onDisappear {
                stopImageLoop()
            }
    }
    
    func startImageLoop() {
        stopImageLoop() // Garante que não há múltiplos Timers rodando
        timer = Timer.scheduledTimer(withTimeInterval: calculateIntervalToTimer(), repeats: true) { _ in
            
            indexHistoryStep = (indexHistoryStep + 1) % assets.count
            
        }
    }
    
    func stopImageLoop() {
        timer?.invalidate()
        timer = nil
    }
}
