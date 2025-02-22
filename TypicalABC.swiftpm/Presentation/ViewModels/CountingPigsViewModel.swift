import SwiftUI
import PencilKit

class CountingPigsViewModel: NSObject, ObservableObject {
    
    let classifier = MNISTClassifierHandler()

    @Published var canvasView = PKCanvasView()
    @Published var imageDrawned: UIImage = UIImage()
    @Published var hasDrawn: Bool = false
    @Published var hasDrawnCorrect: Bool = true
    @Published var recognizedNumber: String = ""
    let numberOfpigs = 1
    
    @Published  var soundVolume = 1
    @Published  var isPlayingSound = false
    @Published  var isPlayingNarration = false
    @Published  var timerImage: Timer?
    @Published  var timerAudio: Timer?

    
    func classifyDrawing() {
        let originalImage = canvasView.drawing.image(from: canvasView.bounds, scale: 1)
        let invertedImage = invertColors(of: originalImage)
        
        if let result = classifier?.classify(image: invertedImage ?? UIImage()) {
            recognizedNumber = result.0!
            imageDrawned = result.1
            
            if Int(recognizedNumber) == numberOfpigs {
                hasDrawnCorrect = true
            } else {
                hasDrawnCorrect = false
            }
            
        } else {
            recognizedNumber = "Erro"
            

        }
    }
    
    func invertColors(of image: UIImage) -> UIImage? {
        guard let cgImage = image.cgImage else { return nil }
        
        let ciImage = CIImage(cgImage: cgImage)
        
        // Aplica o filtro de inversão de cores
        let filter = CIFilter(name: "CIColorInvert")
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        
        guard let outputImage = filter?.outputImage else { return nil }
        
        let context = CIContext()
        
        if let cgImageResult = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgImageResult)
        }
        
        return nil
    }
}



