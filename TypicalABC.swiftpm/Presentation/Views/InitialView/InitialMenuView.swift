import SwiftUI



struct InitialMenuView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    @State private var images = ["InitialBg1", "InitialBg2"]
    @State private var indexMenuStep = 0
    @State private var bgFramesPerSecond = 1

    @State var isSettingOpen = false
    
    var body: some View {
        
        NavigationStack{
            
            ZStack {
                
                ImageLoop(assets: Binding(get: {
                    self.images
                }, set: { value  in
                    self.images = value
                }), indexHistoryStep: Binding(get: {
                    self.indexMenuStep
                }, set: { value  in
                    self.indexMenuStep = value
                }), framesPerSecond: $bgFramesPerSecond, contentMode: .fill)
                    .ignoresSafeArea()
                

                // UI Button Settings
                UIButtons(buttons: ["InfoBtn", "SettingsBtn"])
                    .padding(.vertical)
                
                VStack {
                    
                    Spacer()
                    
                    Button {
                        coordinator.push(page: .HistoryPassView)
                    } label: {}
                        .buttonStyle(PressableButtonStyle(normalImage: "PlayBtn", pressedImage: "PlayBtnPressed", width: 150))
                        .padding(.bottom, 40)

                    
                }
                .padding()
            }
        }
        
    }
}

#Preview {
    InitialMenu()
}

