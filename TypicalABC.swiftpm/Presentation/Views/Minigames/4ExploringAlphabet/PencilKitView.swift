import PencilKit
import SwiftUI

struct PencilKitView: UIViewRepresentable {
    
    typealias UIViewType = PKCanvasView
    
    let toolPicker = PKToolPicker()
    
    func makeUIView(context: Context) -> PKCanvasView {
        let pencilKitCanvasView = PKCanvasView()
        pencilKitCanvasView.drawingPolicy = PKCanvasViewDrawingPolicy.anyInput

        // Definindo a ferramenta de desenho com um traço mais grosso
        let thickInkTool = PKInkingTool(.monoline, color: UIColor(Color.darkGreen), width: 50) // Ajuste o width conforme necessário
        pencilKitCanvasView.tool = thickInkTool
        
        pencilKitCanvasView.becomeFirstResponder()
        
        return pencilKitCanvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {}
}

struct HomeIndicatorHiddenView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .clear
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        uiViewController.setNeedsUpdateOfHomeIndicatorAutoHidden()
    }
}

extension UIViewController {
    public var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
}
