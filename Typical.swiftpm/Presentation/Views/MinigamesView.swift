//
//  SwiftUIView.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 06/02/25.
//

import SwiftUI

struct MinigamesView: View {
    var body: some View {
        VStack{
            NavigationLink {
                OrderTheNumbersView()
            } label: {
                Text("OrderTheNumbersView")
            }
        }
    }
}
