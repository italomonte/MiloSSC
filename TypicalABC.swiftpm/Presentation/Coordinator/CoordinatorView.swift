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
    @ObservedObject var audioManager: AudioManager
    @ObservedObject var settingsManager: SettingsManager
    
    init(coordinator: Coordinator, audioManager: AudioManager, settingsManager: SettingsManager) {
        self.coordinator = coordinator
        self.audioManager = audioManager
        self.settingsManager = settingsManager
    }

    
    var body: some View {
        NavigationStack(path: Binding(
            get: {coordinator.path},
            set: {coordinator.path = $0}
        )){
            ZStack{
                coordinator.build(page: .InitialMenuView)
                    .navigationDestination(for: AppPages.self) { page in
                        coordinator.build(page: page)
                    }
//
//                if settingsManager.isShowingSettingsManager {
//                    StyledPopup()
//                }
               
                
            }
        }
        .environmentObject(coordinator)
        .environmentObject(audioManager)
        .environmentObject(settingsManager)
    }
}
