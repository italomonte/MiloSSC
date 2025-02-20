//
//  PencilKitViewNumver.swift
//  TypicalABC
//
//  Created by Italo Guilherme Monte on 11/02/25.
//

import SwiftUI
import PencilKit

struct PencilKitNumberView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView // Canvas de desenho

    typealias UIViewType = PKCanvasView
    
    let toolPicker = PKToolPicker()
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = PKCanvasViewDrawingPolicy.anyInput

        // Definindo a ferramenta de desenho com um traço mais grosso
        let thickInkTool = PKInkingTool(.crayon, color: .black, width: 20) // Ajuste o width conforme necessário
        canvasView.tool = thickInkTool
        
        canvasView.becomeFirstResponder()
        return canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {}
}

