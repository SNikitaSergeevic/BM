//
//  UsersEnpoint.swift
//  BM
//
//  Created by NikitaSergeevich on 10/08/2022.
//

import Foundation

enum UsersEndpoint {
    
    case allUsers
    case createUser
    case deleteUser
    case loginEmail
    case loginToken
    case updateUser
    
    var baseURL: String {String("http://192.168.0.102:8080/api/users")} // all time calculate ???
    
    
    func urlForRquest() -> URL {  // TODO
        switch self {
        case .loginEmail:
            let url = URL(string:"\(baseURL)/login")!
            return url
        default:
            let url = URL(string:"\(baseURL)")!
            return url
        }
    }
    
    func request(_ user: UserSelf, token: String = "") throws -> URLRequest {
        
        let url = self.urlForRquest()
        
        let jsonData = try JSONEncoder().encode(user)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        
        switch self {
        case .allUsers:
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            return URLRequest(url: url)
        case .createUser:
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonString.data(using: String.Encoding.utf8)
            request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            return request
        case .deleteUser:
            let urlDeleteUser =  URL(string:"\(url)/\(user.id!.uuidString)")!
            var req = URLRequest(url: urlDeleteUser)
            req.httpMethod = "DELETE"
            return req
        case .loginEmail:
            let url = URL(string:"\(url)")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            let authData = (user.email + ":" + user.password).data(using: .utf8)!.base64EncodedString()
            request.addValue("Basic \(authData)", forHTTPHeaderField: "Authorization")
            return request
        case .loginToken:
            let urlLoginToken = URL(string:"\(url)/\(user)/userSelfData")!
            var request = URLRequest(url: urlLoginToken)
            request.httpMethod = "GET"
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorisatoin")
            return request
        case .updateUser:
            let url = URL(string: "\(baseURL)/\(String(describing: user.id))/update")!
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            request.httpBody = jsonString.data(using: String.Encoding.utf8)
            request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
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


