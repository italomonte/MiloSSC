//
//  Template.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 10/02/25.
//



import SwiftUI

struct Template: View {
    
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
                
                // UI
                VStack{
                    HStack {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {}
                            .buttonStyle(PressableButtonStyle(normalImage: "SettingsBtn", pressedImage: "SettingsBtnPressed", width: 150))
                        
                        Spacer()
                        
                        Button {
                            print("settings")
                        } label: {}
                            .buttonStyle(PressableButtonStyle(normalImage: "SettingsBtn", pressedImage: "SettingsBtnPressed", width: 150))
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                
                
                
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}
