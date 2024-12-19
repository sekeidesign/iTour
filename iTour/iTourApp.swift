//
//  iTourApp.swift
//  iTour
//
//  Created by Piergiorgio Gonni on 2024-12-19.
//

import SwiftData
import SwiftUI

@main
struct iTourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
    }
}
