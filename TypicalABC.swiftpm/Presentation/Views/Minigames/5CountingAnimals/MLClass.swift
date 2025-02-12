//
//  MLClass.swift
//  Meu App
//
//  Created by Atos Brito Omena on 31/01/25.
//

import CoreML
import UIKit

class MNISTClassifierHandler {
    private let model: MNISTClassifier
    
    init?() {
        do {
            let config = MLModelConfiguration()
            self.model = try MNISTClassifier(configuration: config)
        } catch {
            print("Erro ao carregar o modelo: \(error)")
            return nil
        }
    }
    
    func classify(image: UIImage) -> String? {
        guard let resizedImage = image.resize(to: CGSize(width: 28, height: 28)),
              let pixelBuffer = resizedImage.toCVPixelBuffer() else {
            print("Falha ao processar a imagem.")
            return nil
        }
        
        do {
            let prediction = try model.prediction(image: pixelBuffer)
            return String(prediction.classLabel)
        } catch {
            print("Erro ao realizar a previsão: \(error)")
            return nil
        }
    }
}

extension UIImage {
    func resize(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        self.draw(in: CGRect(origin: .zero, size: size))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func toCVPixelBuffer() -> CVPixelBuffer? {
        let width = 28
        let height = 28
        
        let attributes: [CFString: Any] = [
            kCVPixelBufferCGImageCompatibilityKey: true,
            kCVPixelBufferCGBitmapContextCompatibilityKey: true
        ]
        
        var pixelBuffer: CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault,
                                         width,
                                         height,
                                         kCVPixelFormatType_OneComponent8,
                                         attributes as CFDictionary,
                                         &pixelBuffer)
        
        guard status == kCVReturnSuccess, let buffer = pixelBuffer else {
            return nil
        }
        
        CVPixelBufferLockBaseAddress(buffer, .readOnly)
        let context = CIContext()
        if let cgImage = self.cgImage {
            let ciImage = CIImage(cgImage: cgImage)
            context.render(ciImage, to: buffer)
        }
        CVPixelBufferUnlockBaseAddress(buffer, .readOnly)
        
        return buffer
    }
}

// Uso:
//if let classifier = MNISTClassifierHandler(),
//   let image = UIImage(named: "digit.png") {
//    if let result = classifier.classify(image: image) {
//        print("Número detectado: \(result)")
//    } else {
//        print("Não foi possível classificar a imagem.")
//    }
//}
