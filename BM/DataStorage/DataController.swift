//
//  DataStorage.swift
//  BM
//
//  Created by NikitaSergeevich on 27/10/2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    static let shared = DataController()
    
   
    
    let container: NSPersistentContainer
    
    
   
    
//    init() {
//        container.loadPersistentStores { description, error in
//            if let error = error {
//                print("Core Data failef to load: \(error.localizedDescription)")
//            }
//        }
//    }
    
    init(inMemory: Bool = false) {
            container = NSPersistentContainer(name: "BM")
            if inMemory {
                container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
            }
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                     */
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            container.viewContext.automaticallyMergesChangesFromParent = true
        }
    
    
}

// MARK: - DataEditor -- for edit data
// MARK: - DataCreator -- for create data
// MARK: - DataProvider -- for get data
// MARK: - Syncronizer -- for provide actual data
// MARK: - Updator -- for change updated data
// MARK: - Newsler -- for message ViewModel about updated data
// MARK: - RequestHandler -- for handler request from ViewModel


