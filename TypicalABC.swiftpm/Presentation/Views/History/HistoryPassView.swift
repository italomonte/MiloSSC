//
//  SwiftUIView.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 06/02/25.
//

import SwiftUI

struct HistoryPassView: View {
    var body: some View {
        Text("History")
        
        NavigationLink {
            HistoryCardsView()
        } label: {
            Text("HistoryCardsView")
        }

    }
}

