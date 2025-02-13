import PencilKit
import SwiftUI

struct PencilKitView: UIViewRepresentable {
    
    typealias UIViewType = PKCanvasView
    
    let toolPicker = PKToolPicker()
    
    func makeUIView(context: Context) -> PKCanvasView {
        let pencilKitCanvasView = PKCanvasView()
        pencilKitCanvasView.drawingPolicy = PKCanvasViewDrawingPolicy.anyInput

        // Definindo a ferramenta de desenho com um traço mais grosso
        let thickInkTool = PKInkingTool(.pen, color: .black, width: 50) // Ajuste o width conforme necessário
        pencilKitCanvasView.tool = thickInkTool
        
        pencilKitCanvasView.becomeFirstResponder()
        
        return pencilKitCanvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {}
}
