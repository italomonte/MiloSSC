//
//  SettingsManager.swift
//  TypicalABC
//
//  Created by Italo Guilherme Monte on 23/02/25.
//

import SwiftUI

class SettingsManager: ObservableObject {
    
    @Published var showSettingsPopUp: Bool = false
    
    @Published var musicEnable: Bool = true
    @Published var soundEffectsEnable: Bool = true
    @Published var colorFilterEnable: Bool = false
    
}
