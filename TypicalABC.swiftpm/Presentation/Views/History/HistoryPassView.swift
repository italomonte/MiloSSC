//
//  SwiftUIView.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 06/02/25.
//

import SwiftUI

struct HistoryPassView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var coordinator: Coordinator
    @ObservedObject var historyPassVm = HistoryPassViewModel()
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                
                // Background
                ImageLoop(assets: $historyPassVm.historyBgMoment, indexHistoryStep: $historyPassVm.indexHistoryStep, framesPerSecond: 1, contentMode: .fill)
                    .ignoresSafeArea()
                
                if historyPassVm.indexHistoryMoment == 5 {
                    
                    Color.black.opacity(0.45)
                        .ignoresSafeArea()
                    
                    VStack{
                        HStack {
                            
                            ZStack {
                                    
                                ImageLoop(assets: $historyPassVm.historyCards[historyPassVm.visibleHistoryCards[0]], indexHistoryStep: $historyPassVm.cardOneStep, framesPerSecond: 1, contentMode: .fit)
                                    .frame(width: geo.size.width * 0.35)
                                    .mask {
                                        RoundedRectangle(cornerRadius: 36)
                                            .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.68)

                                    }
                                    .overlay {
                                        Image("history-border")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.69)
                                    }
                                
                            }
                            
                            Spacer()
                            
                            
                            ZStack {
                                ImageLoop(assets: $historyPassVm.historyCards[historyPassVm.visibleHistoryCards[1]], indexHistoryStep: $historyPassVm.cardTwoStep, framesPerSecond: 13, contentMode: .fit)
                                    .frame(width: geo.size.width * 0.35)
                                    .mask {
                                        RoundedRectangle(cornerRadius: 36)
                                            .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.68)
                                    }
                                    .overlay {
                                        Image("history-border")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.69)
                                    }
                                
                            }

                                
                            
                            
                        }
                        .frame(maxWidth: geo.size.width * 0.74)
                        Spacer()
                    }
                    .frame(maxHeight: geo.size.height * 0.935)

                }
                
                if historyPassVm.indexHistoryMoment == 6 {
                    
                    Color.black.opacity(0.45)
                        .ignoresSafeArea()
                    
                    VStack{
                        HStack {
                            
                            ZStack {
                                
                                ImageLoop(assets: $historyPassVm.historyCards[historyPassVm.visibleHistoryCards[0]], indexHistoryStep: $historyPassVm.cardOneStep, framesPerSecond: 5, contentMode: .fit)
                                    .frame(width: geo.size.width * 0.35)
                                    .mask {
                                        RoundedRectangle(cornerRadius: 36)
                                            .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.68)

                                    }
                                    .overlay {
                                        Image("history-border")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.69)
                                    }
                                
                            }
                            
                            Spacer()
                            
                            
                            ZStack {
                                ImageLoop(assets: $historyPassVm.historyCards[historyPassVm.visibleHistoryCards[1]], indexHistoryStep: $historyPassVm.cardTwoStep, framesPerSecond: 1, contentMode: .fit)
                                    .frame(width: geo.size.width * 0.35)
                                    .mask {
                                        RoundedRectangle(cornerRadius: 36)
                                            .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.68)
                                    }
                                    .overlay {
                                        Image("history-border")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geo.size.width * 0.35, height: geo.size.height * 0.69)
                                    }
                                
                            }
                            
                            
                            
                        }.frame(maxWidth: geo.size.width * 0.74)
                        Spacer()
                    }.frame(maxHeight: geo.size.height * 0.935)

                }
                
                // Content
                VStack{
                    Spacer()
                    
                    ZStack {
                        Image("TextBg")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.9366)
                            .padding(.bottom, geo.size.height * 0.03)
                    
                        HStack {
                            
                            Button {
                                historyPassVm.handleHistoryMoment(movement: .previous)
                            } label: {}
                                .buttonStyle(PressableButtonStyle(normalImage: "PassLeftBtn", pressedImage: "PassLeftBtnPressed", width: geo.size.height * 0.06))
                            
                            Spacer()
                            
                            Button {
                                historyPassVm.handleHistoryMoment(movement: .next)

                            } label: {}
                                .buttonStyle(PressableButtonStyle(normalImage: "PassRightBtn", pressedImage: "PassRightBtnPressed", width: geo.size.height * 0.06))
                        }
                        .frame(width: geo.size.width * 0.96)

                    }
                }
                .padding()
                
                // UI Button Settings
                VStack{
                    HStack {
                        
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {}
                            .buttonStyle(PressableButtonStyle(normalImage: "CloseBtn", pressedImage: "CloseBtnPressed", width: 100))
                        
                        Spacer()
                        
                        Button {
                            print("setting")
                        } label: { }
                        .buttonStyle(PressableButtonStyle(normalImage: "SettingsBtn", pressedImage: "SettingsBtnPressed", width: 100))
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                
                
                
            }
        }
        .onChange(of: historyPassVm.goToCallMinigames, { oldValue, newValue in
            if newValue {
                coordinator.push(page: .CallToMinigames)
            }
        })
        .navigationBarBackButtonHidden(true)
        
    }
}

