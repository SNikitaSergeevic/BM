//
//  UsersServiceable.swift
//  BM
//
//  Created by NikitaSergeevich on 10/08/2022.
//

import Foundation
import UIKit



class UserService: HTTPClient {
    
    let baseUrl = URL(string: "\(UsersEndpoint.getLoginWithToken.baseURL)")!
	
	var profilePicture = Data()
    
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
	
	func getProfilePicture(_ user: UserSelf) async throws -> Data{
	
		let selfUrl = URL(string: "\(UsersEndpoint.getProfilePicture.baseURL)/\(user.id!)/profilePicture")!
		let (data, _) = try await URLSession.shared.data(from: selfUrl)
		
		return data
		
	}
    
    
    //MARK: -POST
    
    func createUser(_ user: UserSelf) async throws -> Void {
     
        let req = try UsersEndpoint.postCreateUser.request(user)
		print(#function, user)
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
	  
	  func updateProfilePicture(_ user: UserSelf, token: String, image: UIImage) async throws -> Void {
		  
		  let boundary = UUID().uuidString
		  let key = "picture"
		  let value = "testPic.jpg"
		  let bodyString = "Content-Disposition: form-data; name=\"\(key)\"; filename=\"\(value)\"\r\n"
		  let headerStirng = "Content-Type: image/jpeg\r\n\r\n"
		  
		  var data = Data()
		  data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
		  data.append(bodyString.data(using: .utf8)!)
		  data.append(headerStirng.data(using: .utf8)!)
		  data.append(image.jpegData(compressionQuality: 0.7)!)
		  data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
		  
		  var request = try UsersEndpoint.postUpdateProfilePicture.request(user, token: token)
		  request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
		  request.httpBody = data
		  
		  URLSession.shared.uploadTask(with: request, from: data) { responseData, response, error in
			  if error == nil {
				  let jsonData = try? JSONSerialization.jsonObject(with: responseData!, options: .allowFragments)
				  if let json = jsonData as? [String: Any] {
					  print(json)
				  }
			  }
		  }.resume()
		  
	  }
	  
    //MARK: -PUT
    
	func updateUserName(_ user: UserSelf) async throws -> Void {
        let req = try UsersEndpoint.putUpdateUser.request(user)
        let task = URLSession.shared.dataTask(with: req) { (data, response, error) in
            if let error = error {
                print("Error user update name")
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







