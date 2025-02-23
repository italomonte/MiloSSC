import SwiftUI

class SettingsManager: ObservableObject {
    
    @Published var showSettingsPopUp: Bool = false
    
    @Published var musicEnable: Bool = true
    @Published var soundEffectsEnable: Bool = true
    @Published var colorFilterEnable: Bool = false
    
}
