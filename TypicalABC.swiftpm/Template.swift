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
