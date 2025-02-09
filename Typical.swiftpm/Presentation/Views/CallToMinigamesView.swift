//
//  SwiftUIView.swift
//  TypicalSSC
//
//  Created by Italo Guilherme Monte on 06/02/25.
//

import SwiftUI

struct CallToMinigamesView: View {
    var body: some View {
        Text("IntroduceMinigamesView")
        
        NavigationLink {
            MinigamesView()
        } label: {
            Text("Minigames View")
        }

    }
}
