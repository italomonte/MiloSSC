//
//  CoordinatorView.swift
//  Stommy
//
//  Created by Italo Guilherme Monte on 10/12/24.
//

import SwiftUI
import SwiftData
import PencilKit

struct CoordinatorView: View {
    

    @ObservedObject var coordinator: Coordinator

    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }

    
    var body: some View {
        NavigationStack(path: Binding(
            get: {coordinator.path},
            set: {coordinator.path = $0}
        )){
            coordinator.build(page: .InitialMenuView)
                .navigationDestination(for: AppPages.self) { page in
                    coordinator.build(page: page)
                }
                
        }
        .environmentObject(coordinator)
    }
}
