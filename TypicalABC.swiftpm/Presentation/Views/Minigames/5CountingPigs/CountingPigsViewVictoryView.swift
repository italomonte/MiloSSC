import SwiftUI

struct CountingPigsViewVictoryView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var coordinator: Coordinator
    @State var isSettingOpen = false
    @Binding var hasDrawn: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                
                // Background
                Image("numbersBg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                // Content
                Image("VictoryNumbersElements")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                // Try Again Button
                
                
                // UI
                UIButtons(buttons: [
                    ("CloseBtn", {dismiss()}),
                    ("SettingsBtn", {isSettingOpen = true})
                ], geo: geo)
                
                
                
            }
            .frame(maxWidth: geo.size.width, maxHeight: calculatePercent(dimensionValue: 739, dimension: .height, geo: geo))
            .background(.white)

        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}
