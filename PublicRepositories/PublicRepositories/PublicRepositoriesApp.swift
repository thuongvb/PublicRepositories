//
//  PublicRepositoriesApp.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/22/24.
//

import SwiftUI

@main
struct PublicRepositoriesApp: App {
    
    init () {
        Logging.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
