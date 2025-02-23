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
    
    @StateObject var coordinator: Coordinator = .init()
    @StateObject var audioManager: AudioManager = .init()
    @StateObject var settingsManager: SettingsManager = .init()
    
    var body: some View {
        CoordinatorView(coordinator: coordinator, audioManager: audioManager, settingsManager: settingsManager)
        
    }
}
