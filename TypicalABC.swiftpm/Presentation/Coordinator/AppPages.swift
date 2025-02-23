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
    case OrderNumbersVictoryView
    
    case ExploringTheAlphabet
    case ExploringTheAlphabetVictoryView
    
    case CountingPigs
}


enum Sheet: String, Identifiable {
    var id: String { self.rawValue }
    
    case teste

}

enum FullScreenCover: String, Identifiable {
    var id: String { self.rawValue }
    
    case teste
}
