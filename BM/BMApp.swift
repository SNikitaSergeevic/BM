//
//  BMApp.swift
//  BM
//
//  Created by NikitaSergeevich on 30/06/2022.
//

import SwiftUI
import CoreData

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("BM AppDelegate didFinishLaunchingWithOptions")
        return true
    }
}

@main
struct BMApp: App {
    
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @Environment(\.scenePhase) var scenePhase
//    var authorisation : Authorisation
//    @StateObject var viewRouter = ViewRouter()
    @StateObject var configurator = Configurator(viewRouter: ViewRouter(), authorisation: Authorisation())

    init() {
        print("BMApp init")
    }
    
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            RegistrationView(viewModel: viewModel)
//            TestView()
//            SearchScreenView()
//            TabBarView(viewRouter: viewRouter)
            ContentView(configurator: configurator)
                .onAppear {
                    print("onAppear ContentView in BMapp")
                }
                .onChange(of: scenePhase) { newScenePhase in
                    switch newScenePhase {
                    case .active:
                        print("App is active")
                    case .inactive:
                        print("App inactive")
                    case .background:
                        print("App is in background")
                    @unknown default:
                        print("unknown default lol")
                    }
                }
//            AdFullView()
                /*
                 1 - полноценная модель юзера, добавить все что должно быть
                 2 - продумать всю модель 
                 
                 */
               
            
        }
    }
}
