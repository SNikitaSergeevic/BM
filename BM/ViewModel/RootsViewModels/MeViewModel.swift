//
//  BM
//
//  Created by NikitaSergeevich on 24/10/2022.
//

import Foundation
import SwiftUI
import CoreData

class MeViewModel: ObservableObject {
    
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var authorisation: Authorisation
    
    
    
    var userService = UserService()
   
    let context = DataController.shared.container.viewContext
    
    
//    @Published var userName: String
    var userImage = Image("testP")
//    @Published var userGrade: Double
//    @Published var userWithUs: String = "22.22.22"
    var token = ""
    
    
    func getSelfToken(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Token")
        fetchRequest.fetchLimit = 1
        
        do{
            let object = try context.fetch(fetchRequest).first as! Token
            token = object.value
            print("getSelfToken \(token)")
        }catch{
             print("unable fetch first tokens")
        }
        
    }
    
    init(viewRouter: ViewRouter, authorisation: Authorisation) {
        self.viewRouter = viewRouter
        self.authorisation = authorisation
//        Task {
//            do {
//                
//                try await authorisation.authorisedUserWithToken()
//                
//            } catch {
//                print("MeView Init error", error.localizedDescription)
//            }
//        }
        
        
        print("MeViewModel init")
//        self.userWithUs = authorisation.userSelf.createdAt!.formatted()
    }
}
