//
//  Coordinator.swift
//  Stommy
//
//  Created by Italo Guilherme Monte on 10/12/24.
//

import SwiftUI
import SwiftData

class Coordinator: ObservableObject {
    
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
        
    func push(page: AppPages) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func presentFullScreenCover(_ cover: FullScreenCover) {
        self.fullScreenCover = cover
    }
    
    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    @ViewBuilder
    func build(page: AppPages) -> some View {
            switch page {
                
            // Menu
            case .InitialMenuView: InitialMenuView()
                
            // History
            case .InfoView: InfoView()
            case .HistoryPassView: HistoryPassView()
            case .H9View: H9View()
            case .H10View: H10View()
                
            // Minigames Menu
            case .CallToMinigames: CallToMinigamesView()
            case .MinigamesMenuView: MinigamesMenuView()
            
            // Minigames
            case .OrderTheNumbersView: OrderNumbersView()
            case .ExploringTheAlphabet: ExploringAlphabetView()
            case .CountingAnimals: CountingAnimalsView()

            }
        }

        
}
