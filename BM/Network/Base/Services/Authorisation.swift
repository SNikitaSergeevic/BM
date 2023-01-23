//
//  Authorisation.swift
//  BM
//
//  Created by NikitaSergeevich on 06/07/2022.
//

import Foundation
import SwiftUI
import CoreData

class Authorisation: HTTPClient, ObservableObject {
    
    @Published var userSelf = UserSelf(name: "enter name", email: "enter email", phoneNumber: "enter phone number", password: "", sex: "enter sex")
	@Published var indicator = 0
    
    private var baseUrl = "\(UsersEndpoint.getLoginWithToken.baseURL)"
    private var tokenVal = ""
    private var tokenUserID = ""
    
    private let context = DataController.shared.container.viewContext
    
    func loginEmail(user: UserSelf) async throws -> Void {
        let req = try UsersEndpoint.postLoginEmail.request(user)
        
        let decoder = JSONDecoder()
        
        let task = URLSession.shared.dataTask(with: req) { (data, response, error) in
            
            if let error = error {
                print("Error place took: \(error)")
                return
            } else if let data = data, let dataString = String(data: data, encoding: .utf8) {
                
                print("Responce string:\n \(dataString)")
                do {
                    let tokenResult = try decoder.decode(TokenUserSelf.self, from: data)
                    self.tokenVal = tokenResult.value
                    self.tokenUserID = tokenResult.user.id
                    print("add token in persistence access - \(self.addSelfToken())")
                    print("self token", tokenResult.value)
                } catch {
                    print("error decode",error.localizedDescription)
                }
            }
        }
        task.resume()
        
    }
    
    
    func addSelfToken() -> Bool{
        
        let token = Token(context: context)
        token.user = tokenUserID
        token.value = tokenVal
        print("addSelfToken")
        if let _ = try? context.save() {
            return true
        }
        return false
    }
    
    
    func checkIsEmptyToken() -> Bool {
        do {
            let request = NSFetchRequest<Token>(entityName: "Token")
            let count = try context.count(for: request)
            if count != 0 {
                let res = getAllTokens()
                print("check all tokens, count is \(res.count) ", res)
                
            }
            return count == 0
        } catch {
            return true
        }
    }
    
    
    func getAllTokens()->[NSManagedObject]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Token")
        var result = [NSManagedObject]()
        
        do{
            let tokens = try context.fetch(fetchRequest)
            if let tokens = tokens as? [NSManagedObject] {
                result = tokens
            }
        }catch{
             print("unable fetch all tokens")
        }
        return result
    }
    
    
    func authorisedUserWithToken() async throws -> UserSelf {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter().decoderDateFormatter()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        if !checkIsEmptyToken(){
            let allTokens = getAllTokens()
            tokenVal = "\(allTokens[0].value(forKey: "value")!)"
            tokenUserID = "\(allTokens[0].value(forKey: "user")!)"
            
            let url = URL(string:"\(baseUrl)/\(tokenUserID)/selfUserData")!
            
            var req = URLRequest(url: url)
            req.httpMethod = "GET"
            req.addValue("Bearer \(tokenVal)", forHTTPHeaderField: "Authorisatoin")
            
            let task = URLSession.shared.dataTask(with: req) { (data, response, error) in
                if let error = error {
                    print("error", #function, error.localizedDescription)
                } else if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    do {
                        let result = try decoder.decode(UserSelf.self, from: data)
                        self.userSelf = result
                        print("userSelf in place \(dataString)")
                    } catch {
                        print("error decode", error.localizedDescription)
                    }
                }
            }
            task.resume()
			print(userSelf.name)
			return userSelf
        } else {
            print("Token not found", #function)
			return userSelf
        }
        
    }
    
    
}



