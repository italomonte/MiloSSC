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
        ZStack{
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
            .environmentObject(audioManager)
            .environmentObject(settingsManager)
            
            if settingsManager.showSettingsPopUp {
                PopUpSettingsView(settingsManager: settingsManager, audioManager: audioManager)
            }
        }
    }
}

