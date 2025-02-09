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
    
    @ObservedObject var coordinator: Coordinator = Coordinator()
    
    var body: some View {
        CoordinatorView(coordinator: coordinator)

    }
}
