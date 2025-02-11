//
//  SwiftUIView.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 06/02/25.
//

import SwiftUI

struct H9View: View {
    var body: some View {
        Text("History")
        
        NavigationLink {
            H10View()
        } label: {
            Text("H10")
        }

    }
}

