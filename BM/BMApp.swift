//
//  BMApp.swift
//  BM
//
//  Created by NikitaSergeevich on 30/06/2022.
//

import SwiftUI

@main
struct BMApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            RegistrationView()
        }
    }
}
