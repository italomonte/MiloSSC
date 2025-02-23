import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            InitialMenu()
        }
    }
}


struct InitialMenu: View {
    
    @ObservedObject var coordinator: Coordinator = .init()
    @ObservedObject var audioManager: AudioManager = .init()
    @ObservedObject var settingsManager: SettingsManager = .init()
    
    var body: some View {
        CoordinatorView(coordinator: coordinator, audioManager: audioManager, settingsManager: settingsManager)
        
    }
}
