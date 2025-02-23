import SwiftUI
import PencilKit
import UIKit

struct CountingPigsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var audioManager: AudioManager
    
    @State private var isSettingOpen: Bool = false
    @State var isMinimizeModal: Bool = false
    
    @ObservedObject var countingPigsVm = CountingPigsViewModel()
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                
                ARViewContainer()
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isMinimizeModal = true
                        }
                    }
                
                VStack{
                    Spacer()
                    ZStack{
                        
                        if !countingPigsVm.hasDrawn {
                            DrawingPigsCountView(geo: geo, countingPigsVm: countingPigsVm, isMinimizeModal: $isMinimizeModal)
                            
                        } else if countingPigsVm.hasDrawn && !countingPigsVm.hasDrawnCorrect {
                            // tela de derrota
                            LosingPigsCountView(geo: geo, canvasView: $countingPigsVm.canvasView, hasDrawn: $countingPigsVm.hasDrawn)
                            
                        } else if countingPigsVm.hasDrawn && countingPigsVm.hasDrawnCorrect {
                            // tela de winning
                            WinningPigsCountView(geo: geo, canvasView: $countingPigsVm.canvasView, hasDrawn: $countingPigsVm.hasDrawn)
                        }
                        
                    }
                    .offset(y: isMinimizeModal ? geo.size.height * 0.2 : 0)
                    
                }
                .onTapGesture {
                    withAnimation {
                        isMinimizeModal = false
                    }
                }
                
                UIButtons(buttons: [
                    ("CloseBtn", {dismiss()}),
                    ("SettingsBtn", {isSettingOpen = true}),
                ], geo: geo)
            }
            .navigationBarBackButtonHidden(true)
            .onAppear{
                audioManager.setupAudios(from: .init(filename: [.promptCounting], fileExtension: .m4a, volume: 1))
            }
        }
        
    }

    
}
