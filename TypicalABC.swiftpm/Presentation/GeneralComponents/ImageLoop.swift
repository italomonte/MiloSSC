import SwiftUI

struct ImageLoop: View {
    
    @Binding var assets: [String]
    @Binding var indexHistoryStep: Int
    @State private var timer: Timer?
    @Binding var framesPerSecond: Int
    var contentMode: ContentMode
    
    func calculateIntervalToTimer() -> Double {
        return 1.0/Double(framesPerSecond)
    }
    
    var body: some View {
        Image(assets[indexHistoryStep % assets.count])
            .resizable()
            .aspectRatio(contentMode: contentMode)
            .onAppear {
                startImageLoop()
            }
            .onChange(of: framesPerSecond) { oldValue, newValue in
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
