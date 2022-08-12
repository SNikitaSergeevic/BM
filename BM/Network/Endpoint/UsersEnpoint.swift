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
    
    var baseURl: String {String("http://127.0.0.1:8080")} // all time calculate ???
    
    func urlForRquest() -> URL {
        switch self {
        case .allUsers:
            let url = URL(string:"\(baseURl)/api/users")!
            return url
        case .createUser:
            let url = URL(string:"\(baseURl)/api/users")!
            return url
        case .deleteUser:
            let url = URL(string:"\(baseURl)/api/users")!
            return url
        }
    }
    
    func rquest(_ user: User) throws -> URLRequest {
        
        let url = UsersEndpoint.createUser.urlForRquest()
        
        let jsonData = try JSONEncoder().encode(user)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        
        switch self {
        case .allUsers:
            let url = URL(string:"\(baseURl)/api/users")!
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
            let url =  URL(string:"\(baseURl)/api/users/\(user.id!.uuidString)")!
            var req = URLRequest(url: url)
            req.httpMethod = "DELETE"
            return req
        }
    }
    
}


