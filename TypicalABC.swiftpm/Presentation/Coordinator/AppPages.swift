//
//  Coordinator.swift
//  Stommy
//
//  Created by Italo Guilherme Monte on 10/12/24.
//

import Foundation

enum AppPages: Hashable {
    
    // Menu
    case InitialMenuView
    case InfoView
    
    // History
    case HistoryPassView
    
    // Minigames Menu
    case CallToMinigames
    case MinigamesMenuView
    
    // Minigames
    case OrderTheNumbersView
    case ExploringTheAlphabet
    case CountingAnimals
}


enum Sheet: String, Identifiable {
    var id: String { self.rawValue }
    
    case teste

}

enum FullScreenCover: String, Identifiable {
    var id: String { self.rawValue }
    
    case teste
}
