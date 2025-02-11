//
//  SwiftUIView.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 06/02/25.
//

import SwiftUI

struct HistoryCardsView: View {
    var body: some View {
        Text("History")
        
        NavigationLink {
            H9View()
        } label: {
            Text("H9")
        }

    }
}

