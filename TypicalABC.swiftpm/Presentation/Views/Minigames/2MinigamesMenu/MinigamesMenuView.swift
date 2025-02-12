//
//  SwiftUIView.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 06/02/25.
//

import SwiftUI

struct MinigamesMenuView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var coordinator: Coordinator
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                
                // Background
                Image("minigamesBg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack{
                    
                    ScrollView {
                        HStack (spacing: 20){
                            
                            Button {
                                coordinator.push(page: .OrderTheNumbersView)
                            } label: {
                                Text("Order the number fluffies")
                                    .foregroundStyle(.white)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(.green)
                                            .frame(width: 300, height: 200)
                                    )
                            }
                            
                            Button {
                                coordinator.push(page: .ExploringTheAlphabet)
                            } label: {
                                Text("Exploring the alphabet")
                                    .foregroundStyle(.white)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(.green)
                                            .frame(width: 300, height: 200)
                                    )
                            }
                            
                            Button {
                                coordinator.push(page: .CountingAnimals)
                            } label: {
                                Text("Counting AnimalS")
                                    .foregroundStyle(.white)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(.green)
                                            .frame(width: 300, height: 200)
                                    )
                            }
                        }
                    }
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
