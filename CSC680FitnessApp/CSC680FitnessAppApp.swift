//
//  CSC680FitnessAppApp.swift
//  CSC680FitnessApp
//
//  Created by Andy Byeon on 3/28/24.
//

import SwiftUI

@main
struct CSC680FitnessAppApp: App {
    @StateObject var manager = HealthManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}
