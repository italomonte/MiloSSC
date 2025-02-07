//
//  SwiftUIView.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 06/02/25.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        Text("History")
        
        NavigationLink {
            IntroduceMinigamesView()
        } label: {
            Text("Minigames View")
        }

    }
}

