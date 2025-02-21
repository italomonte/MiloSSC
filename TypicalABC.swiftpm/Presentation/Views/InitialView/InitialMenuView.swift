import SwiftUI



struct InitialMenuView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    @Environment(\.dismiss) var dismiss
    @State private var images = ["InitialBg1", "InitialBg2"]
    @State private var indexMenuStep = 0
    @State private var bgFramesPerSecond = 1

    @State var isSettingOpen = false
    
    func registerCustomFont() {
        guard let fontURL = Bundle.main.url(forResource: "PatrickHand-Regular", withExtension: "ttf"),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Erro ao carregar a fonte")
        }

        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            print("Erro ao registrar a fonte: \(error!.takeRetainedValue())")
        }
    }
    
    init() {
        registerCustomFont()
    }
    
    var body: some View {
        
        
        NavigationStack{
            GeometryReader{ geo in
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
                    UIButtons(buttons: [
                        ("InfoBtn", {coordinator.push(page: .InfoView)}),
                        ("SettingsBtn", {isSettingOpen = true}),
                    ], geo: geo)
                    .padding(.vertical)
                    
                    VStack {
                        
                        Spacer()
                        
                        Button {
                            coordinator.push(page: .HistoryPassView)
                        } label: {}
                            .buttonStyle(PressableButtonStyle(normalImage: "PlayBtn", pressedImage: "PlayBtnPressed", width: calculatePercent(dimensionValue: 276, dimension: .width, geo: geo)))
                        
                    }
                    .padding(.bottom, calculatePercent(dimensionValue: 150, dimension: .height, geo: geo))
                }
            }
        }
        
    }
}

#Preview {
    InitialMenu()
}

