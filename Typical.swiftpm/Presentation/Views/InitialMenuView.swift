import SwiftUI



struct InitialMenuView: View {
    
    @EnvironmentObject var coordinator: Coordinator

    @State var isSettingOpen = false
    
    var body: some View {
        NavigationStack{
            
            ZStack {
                
                ImageLoop(assets: ["InitialBg1", "InitialBg2"])
                    .ignoresSafeArea()
                
                VStack{
                    HStack {
                        
                        NavigationLink {
                            InfoView()
                        } label: {}
                            .buttonStyle(PressableButtonStyle(normalImage: "InfoBtn", pressedImage: "InfoBtnPressed", width: 100))
                        
                        Spacer()
                        
                        ZStack {
                            ImagePressable(assets: ["SettingsBtn", "SettingsBtnPressed"], width: 100)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            isSettingOpen.toggle()
                        }

                            

                    }
                    .padding()
                    
                    Spacer()
                }
                .padding(.vertical)
                
                VStack {
                    
                    Spacer()
                    
                    Button {
                        coordinator.push(page: .OrderTheNumbersView)
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
