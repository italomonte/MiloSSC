import SwiftUI
import PencilKit

struct CountingPigsView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var isSettingOpen: Bool = false

    @State private var canvasView = PKCanvasView()
    @State private var recognizedNumber: String = "Desenhe um número"
    
    @State private var hasDrawn: Bool = true
    @State private var hasDrawnCorrect: Bool = false
    
    let classifier = MNISTClassifierHandler() // Modelo de ML
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                
                //            ARViewContainer()
                //                .ignoresSafeArea()
                
                Color.black
                    .ignoresSafeArea()
                
                VStack{
                    Spacer()
                    ZStack{
                        
                        if !hasDrawn {
                            DrawingPigsCountView(geo: geo, canvasView: $canvasView)
                            
                        } else if hasDrawn && !hasDrawnCorrect {
                            // tela de derrota
                            LosingPigsCountView(geo: geo, canvasView: $canvasView, hasDrawn: $hasDrawn)
                            
                        } else if hasDrawn && hasDrawnCorrect {
                            // tela de winning
                            WinningPigsCountView(geo: geo, canvasView: $canvasView, hasDrawn: $hasDrawn)
                        }
                        
                    }

                }
            }
            
            UIButtons(buttons: [
                ("CloseBtn", {dismiss()}),
                ("SettingsBtn", {isSettingOpen = true}),
            ], geo: geo)
        }
        .navigationBarBackButtonHidden(true)    
    }
    
    private func classifyDrawing() {
        let image = canvasView.drawing.image(from: canvasView.bounds, scale: 1.0)
        
        if let result = classifier?.classify(image: image) {
            recognizedNumber = result
        } else {
            recognizedNumber = "Erro"
        }
    }
}

