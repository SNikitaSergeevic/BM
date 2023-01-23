//
//  UsersEnpoint.swift
//  BM
//
//  Created by NikitaSergeevich on 10/08/2022.
//

import Foundation

enum UsersEndpoint {
	
	var baseURL: String {String("http://192.168.0.104:8080/api/users")} // all time calculate ???
    
    case getAllUsers
    case postCreateUser
    case deleteUser
    case postLoginEmail
    case getLoginWithToken
    case putUpdateUser
	case getProfilePicture
	case postUpdateProfilePicture
    
    func urlForRquest() -> URL {  // TODO
        switch self {
        case .postLoginEmail:
            let url = URL(string:"\(baseURL)/login")!
            return url
        default:
            let url = URL(string:"\(baseURL)")!
            return url
        }
    }
	
	func getUrl(_ user: UserSelf, token: String) -> URL {
		var url = URL(string: "uformed url")!
		switch self {
		case .getAllUsers:
			url = URL(string:"\(baseURL)")!
		case .postCreateUser:
			url = URL(string:"\(baseURL)")!
		case .deleteUser:
			url = URL(string:"\(baseURL)/\(user.id!.uuidString)")!
		case .postLoginEmail:
			url = URL(string:"\(baseURL)/login")!
		case .getLoginWithToken:
			url = URL(string:"\(baseURL)/\(user.id!)/userSelfData")!
		case .putUpdateUser:
			url = URL(string:"\(baseURL)/\(user.id!)/update")!
		case .getProfilePicture:
			url = URL(string:"\(baseURL)/\(user.id!)/profilePicture")!
		case .postUpdateProfilePicture:
			url = URL(string:"\(baseURL)/\(user.id!)/addProfilePicture")!
		}
		return url
	}
    
    func request(_ user: UserSelf, token: String = "") throws -> URLRequest {
        
        let url = self.urlForRquest()
        
        let jsonData = try JSONEncoder().encode(user)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        
        switch self {
        case .getAllUsers:
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            return URLRequest(url: url)
        case .postCreateUser:
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonString.data(using: String.Encoding.utf8)
            request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            return request
        case .deleteUser:
            let urlDeleteUser = URL(string:"\(url)/\(user.id!.uuidString)")!
            var req = URLRequest(url: urlDeleteUser)
            req.httpMethod = "DELETE"
            return req
        case .postLoginEmail:
            let url = URL(string:"\(url)")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            let authData = (user.email + ":" + user.password).data(using: .utf8)!.base64EncodedString()
            request.addValue("Basic \(authData)", forHTTPHeaderField: "Authorization")
            return request
        case .getLoginWithToken:
            let urlLoginToken = URL(string:"\(url)/\(user)/userSelfData")!
            var request = URLRequest(url: urlLoginToken)
            request.httpMethod = "GET"
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorisatoin")
            return request
        case .putUpdateUser:
            let url = URL(string: "\(baseURL)/\(String(describing: user.id))/update")!
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            request.httpBody = jsonString.data(using: String.Encoding.utf8)
            request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            return request
		case .getProfilePicture:
			let url = URL(string: "\(baseURL)/\(String(describing: user.id))/profilePicture")!
			var request = URLRequest(url: url)
			request.httpMethod = "GET"
			return request
		case .postUpdateProfilePicture:
			let url = URL(string: "\(baseURL)/\(user.id!)/addProfilePicture")!
			var request = URLRequest(url: url)
			request.httpMethod = "POST"
			return request
        }
    }
    
    func requestForTokenLogin(token: TokenUserSelf) throws -> URLRequest {
        let url = URL(string:"\(baseURL)/\(token.user.id)/userSelfData")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(token.value)", forHTTPHeaderField: "Authorisatoin")
        return request
    }
    
}


