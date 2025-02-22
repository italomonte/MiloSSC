//
//  SwiftUIView.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 06/02/25.
//

import SwiftUI

struct MinigamesMenuView: View {
    
    @State var isSettingOpen = false
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var coordinator: Coordinator
    
    let destinations: [AppPages] = [.OrderTheNumbersView, .ExploringTheAlphabet, .CountingPigs]
    var body: some View {
        GeometryReader { geo in
            ZStack{
                
                // Background
                Image("minigamesBg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack{
                    ScrollView(.horizontal) {
                        HStack (spacing: 20){
                            
                            ForEach(0 ..< 3) { index in
                                Button {
                                    coordinator.push(page: destinations[index])
                                } label: {
                                    VStack{
                                        Image("capa" + String(index))
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geo.size.width * 0.33)
                                        
                                        Text(index == 0 ? "Order the number fluffies" : (index == 1 ? "Exploring the alphabet" : "Counting pigs"))
                                            .font(.patrickHand)
                                            .foregroundStyle(.white)
                                    }
                                }
                            }

                        }
                    }
                    .scrollIndicators(.hidden)
                    .padding(.horizontal, 97)
                    .scrollClipDisabled(true)
                    
                }

                
                // UI
                UIButtons(buttons: [
                    ("InfoBtn", {coordinator.push(page: .InfoView)}),
                    ("StoryBtn", {coordinator.popTo(page: 0)}),
                    ("SettingsBtn", {isSettingOpen = true})
                ], geo: geo)
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
    
}
