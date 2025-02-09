//
//  SwiftUIView.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 08/02/25.
//

import SwiftUI

struct ImageLoop: View {
    
    var assets: [String]
    @State private var index = 0
    @State private var timer: Timer?
    
    var body: some View {
        Image(assets[index])
            .resizable()
            .scaledToFill()
            .onAppear {
                startImageLoop()
            }
            .onDisappear {
                stopImageLoop()
            }
    }
    
    func startImageLoop() {
            stopImageLoop() // Garante que não há múltiplos Timers rodando
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                    index = (index + 1) % assets.count
                
            }
        }
        
        func stopImageLoop() {
            timer?.invalidate()
            timer = nil
        }
}
