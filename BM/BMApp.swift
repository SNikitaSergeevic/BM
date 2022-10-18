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
    let viewModel = ViewModel()
    
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            RegistrationView(viewModel: viewModel)
//            TestView()
//            SearchScreenView()
//            TabBarView(viewRouter: viewRouter)
            ContentView(viewRouter: viewRouter)
//            AdFullView()
            
               
            
        }
    }
}
