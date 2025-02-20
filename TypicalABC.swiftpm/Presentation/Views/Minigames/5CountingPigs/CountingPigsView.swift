import SwiftUI
import PencilKit

struct CountingPigsView: View {
    @State private var canvasView = PKCanvasView()
    @State private var recognizedNumber: String = "Desenhe um número"
    @State private var imageDrawned: UIImage?
    
    let classifier = MNISTClassifierHandler() // Modelo de ML

    var body: some View {
        
        ZStack{
            
            ARViewContainer()
                .ignoresSafeArea()
            
//            VStack {
//                PencilKitNumberView(canvasView: $canvasView)
//                    .frame(width: 200, height: 200)
//                    .border(Color.gray, width: 4)
//                
//                Button("Identificar Número") {
//                    classifyDrawing()
//                }
//                .padding()
//                
//                Text("Número identificado: \(recognizedNumber)")
//                    .font(.title)
//                    .bold()
//                
//                Text("Número desenhadao")
//                Image(uiImage: imageDrawned ?? UIImage())
//                    .border(.red)
//            }
        }
    }

    private func classifyDrawing() {
        let image = canvasView.drawing.image(from: canvasView.bounds, scale: 1.0)
        self.imageDrawned = image
        
        if let result = classifier?.classify(image: image) {
            recognizedNumber = result
        } else {
            recognizedNumber = "Erro"
        }
    }
}
