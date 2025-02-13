import SwiftUI



struct InitialMenuView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    @State private var images = ["InitialBg1", "InitialBg2"]
    @State private var indexMenuStep = 0

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
                }), framesPerSecond: 1, contentMode: .fill)
                    .ignoresSafeArea()
                
                VStack{
                    
                    // Header
                    HStack {
                        
                        Button {
                            coordinator.push(page: .InfoView)
                        } label: {}
                            .buttonStyle(PressableButtonStyle(normalImage: "InfoBtn", pressedImage: "InfoBtnPressed", width: 100))
                        
                        Spacer()
                        
                        
                        Button {
                            isSettingOpen.toggle()
                        } label: {}
                            .buttonStyle(PressableButtonStyle(normalImage: "SettingsBtn", pressedImage: "SettingsBtnPressed", width: 100))
                        
                    }
                    .padding()
                    
                    Spacer()
                }
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
