import SwiftUI

struct Template: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var coordinator: Coordinator
    @State var isSettingOpen = false

    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                
                // Background
                Image("alphabetBg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                // UI
                UIButtons(buttons: [
                    ("CloseBtn", {dismiss()}),
                    ("SettingsBtn", {isSettingOpen = true})
                ], geo: geo)
                
                
                
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}
