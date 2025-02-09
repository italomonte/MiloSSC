//
//  SwiftUIView.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 06/02/25.
//

import SwiftUI

struct H10View: View {
    var body: some View {
        Text("History")
        
        NavigationLink {
            CallToMinigamesView()
        } label: {
            Text("CallToMinigames")
        }

    }
}

