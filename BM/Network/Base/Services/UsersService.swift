//
//  UsersServiceable.swift
//  BM
//
//  Created by NikitaSergeevich on 10/08/2022.
//

import Foundation


class UserService: HTTPClient {
    
    
    //MARK: -GET
    
    func getAllUsers() async throws -> [User] {
        let url = UsersEndpoint.allUsers.urlForRquest()
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter().decoderDateFormatter()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let userResult = try decoder.decode([User].self, from: data)
            print("result", String(data: data, encoding: .utf8))
            return userResult
        } catch {
            print("error decode", error.localizedDescription)
            return [User]()
        }
        
    }
    
    //MARK: -POST
    
    func createUser(_ user: User) async throws -> Void {
     
        let req = try UsersEndpoint.createUser.rquest(user)
        
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: req) { (data, response, error) in
            
            // Check for Error
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Convert HTTP Response Data to a String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
    }
    
    //MARK: -DELETE
    
    func deleteUser(userID: String) async throws -> Void {
        
        let url = URL(string:"http://127.0.0.1:8080/api/users/\(userID)")!
        
//        let (data, _) = try await URLSession.shared.data(from: url)
//
//        do {
//
//            print("delete acess")
//
//        } catch {
//            print("error decode", error.localizedDescription)
//
//        }
        var req = URLRequest(url: url)
        req.httpMethod = "DELETE"
        let task = URLSession.shared.dataTask(with: req) { (data, response, error) in
            
            // Check for Error
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Convert HTTP Response Data to a String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
        
        
    }
    
    
    
    
}





