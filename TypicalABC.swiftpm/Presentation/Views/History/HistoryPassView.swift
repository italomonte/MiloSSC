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
    @State var bgFramesPerSecond: Int = 1
    var body: some View {
        GeometryReader { geo in
            ZStack{
                // Background
                ImageLoop(assets: $historyPassVm.historyBgMoment, indexHistoryStep: $historyPassVm.indexHistoryStep, framesPerSecond: $bgFramesPerSecond, contentMode: .fill)
                    .ignoresSafeArea()
                    .onAppear{
                        print(historyPassVm.historyBgMoment)

                    }
                    .onChange(of: historyPassVm.historyBgMoment) { _, newValue in
                        print(newValue)
                    }
                
                // Content
                if historyPassVm.indexHistoryMoment >= 5 {
                    
                    Color.black.opacity(0.45)
                        .ignoresSafeArea()
                    
                    CardsContainer(geo: geo, historyPassVm: historyPassVm)
                }
                
                VStack{
                    Spacer()
                    TextContainer(historyPassVm: historyPassVm, geo: geo)
                }
                .padding()
                
                // UI Button Settings
                VStack{
                    UIButtons(buttons: ["CloseBtn", "SettingsBtn"])
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

