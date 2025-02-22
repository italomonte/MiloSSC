import ARKit
import RealityKit
import SwiftUI


struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        
        let arView: ARView = ARView(frame: .zero)
        arView.cameraMode = .ar
        
        arView.addCoaching()
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        config.environmentTexturing = .automatic
        
        arView.session.run(config)
        
        let anchor = AnchorEntity(plane: .horizontal)
                
        if let modelEntity = try? Entity.load(named: "porquin.usdz") {
            
            let modelEntity1 = modelEntity
        
            
            anchor.addChild(modelEntity1)
        } else {
            print("Falha ao carregar o modelo USDC")
        }

        
        arView.scene.addAnchor(anchor)
        arView.environment.sceneUnderstanding.options.insert(.occlusion)

        
        arView.environment.lighting.intensityExponent = 2.5
        
        return arView
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    
}

