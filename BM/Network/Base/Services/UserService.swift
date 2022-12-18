//
//  UsersServiceable.swift
//  BM
//
//  Created by NikitaSergeevich on 10/08/2022.
//

import Foundation



class UserService: HTTPClient {
    
    let baseUrl = URL(string: "\(UsersEndpoint.loginToken.baseURL)")!
    
    //MARK: -GET
    // why this use???
    func getAllUsers() async throws -> [UserSelf] {
       
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter().decoderDateFormatter()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let (data, _) = try await URLSession.shared.data(from: baseUrl)
        
        do {
            let userResult = try decoder.decode([UserSelf].self, from: data)
            print("result", String(data: data, encoding: .utf8))
            return userResult
        } catch {
            print("error decode", error.localizedDescription)
            return [UserSelf]()
        }
        
    }
    
    
    //MARK: -POST
    
    func createUser(_ user: UserSelf) async throws -> Void {
     
        let req = try UsersEndpoint.createUser.request(user)
        
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
    
    //MARK: -PUT
    
    func updateUserName(_ user: UserSelf) async throws -> Void {
        let req = try UsersEndpoint.updateUser.request(user)
        let task = URLSession.shared.dataTask(with: req) { (data, response, error) in
            
            if let error = error {
                print("Error user update")
                return
            }
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("response data string: \n \(dataString)")
            }
        }
        task.resume()
    }
    
    //MARK: -DELETE
    
    func deleteUser(userID: String) async throws -> Void {
        
        let url = URL(string:"http://127.0.0.1:8080/api/users/\(userID)")!
        
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





