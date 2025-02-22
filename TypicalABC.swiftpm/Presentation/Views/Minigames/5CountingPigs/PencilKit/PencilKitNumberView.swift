import SwiftUI
import PencilKit

struct PencilKitNumberView: UIViewRepresentable {
    @ObservedObject var countingPigsVm: CountingPigsViewModel // Canvas de desenho
    
    let toolPicker = PKToolPicker()
    
    func makeUIView(context: Context) -> PKCanvasView {
        countingPigsVm.canvasView.drawingPolicy = PKCanvasViewDrawingPolicy.anyInput
        countingPigsVm.canvasView.backgroundColor = .clear

        // Definindo a ferramenta de desenho com um traço mais grosso
        let thickInkTool = PKInkingTool(.monoline, color: .black, width: 15)
        countingPigsVm.canvasView.tool = thickInkTool
        
        // Definindo o delegate
        countingPigsVm.canvasView.delegate = context.coordinator
        
        countingPigsVm.canvasView.becomeFirstResponder()
        return countingPigsVm.canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
    }
    
    // Criando um Coordinator para lidar com eventos de desenho
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, PKCanvasViewDelegate {
        var parent: PencilKitNumberView
        private var lastDrawingStrokeCount = 0

        init(_ parent: PencilKitNumberView) {
            self.parent = parent
        }

        func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
            let strokeCount = canvasView.drawing.strokes.count
            if strokeCount > lastDrawingStrokeCount {
                print("Desenho iniciado ou alterado!")
                parent.countingPigsVm.classifyDrawing()
                parent.countingPigsVm.hasDrawn = true
                
            }
            lastDrawingStrokeCount = strokeCount
        }
    }
}
