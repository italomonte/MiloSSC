

import SwiftUI
import PencilKit

struct ExploringAlphabetView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var coordinator: Coordinator
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                
                // Background
                Image("alphabetBg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                // Content
                ZStack {
                    Image("AVazado")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.604, height: geo.size.height * 0.633)
                    
                    PencilKitView()
                        .frame(width: geo.size.width * 0.604, height: geo.size.height * 0.633)
                        .mask(
                            Image("A")
                                .resizable()
                                .scaledToFit()
                                    
                                .frame(width: geo.size.width * 0.311)
                                .blendMode(.destinationOver)
                        )
                        .offset(y: 11)
                }

                // UI
                VStack{
                    HStack {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image("CloseBtn")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 0.08 * geo.size.width)
                        }
                        
                        Spacer()
                        
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image("SettingsBtn")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 0.08 * geo.size.width)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                
                
                
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}

