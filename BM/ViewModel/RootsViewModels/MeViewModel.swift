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
	@Published var userSelf: UserSelf
	@Published var userImage: UIImage = UIImage(systemName: "questionmark")!
    var userService = UserService()
    
   
    let context = DataController.shared.container.viewContext
    
    
//    @Published var userName: String
//    var userImage = Image("testP")
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
    
	func getSelfUser() async throws {
		do {
			userSelf = try await authorisation.authorisedUserWithToken()
			if let image = UIImage(data: try await userService.getProfilePicture(userSelf)) {
				userImage = image } else {userImage = UIImage(systemName: "questionmark")!}
		} catch {
			
		}
	}
	
	func updateUserImage() async throws {
		do {
			try await userService.updateProfilePicture(userSelf, token: token, image: userImage)
		} catch {
			
		}
	}
	
	
	init(viewRouter: ViewRouter, authorisation: Authorisation, userSelf: UserSelf) {
        self.viewRouter = viewRouter
		self.userSelf = userSelf
		self.authorisation = authorisation
        
        
        print("MeViewModel init")
//        self.userWithUs = authorisation.userSelf.createdAt!.formatted()
    }
}
