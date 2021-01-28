//
//  PostalCodeApp.swift
//  PostalCode
//
//  Created by maca on 2021/01/26.
//

import SwiftUI

@main
struct PostalCodeApp: App {
    
    init() {
        DatabaseManager.shared.initialize()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
