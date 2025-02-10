//
//  SwiftUIView.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 06/02/25.
//

import SwiftUI

struct MinigamesView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        VStack{
            
            Button {
                coordinator.push(page: .OrderTheNumbersView)
            } label: {
                Text("Order the number fluffies")
            }
            
            Button {
                coordinator.push(page: .ExploringTheAlphabet)
            } label: {
                Text("Exploring the alphabet")
            }

        }
    }
}
