//
//  UsersEnpoint.swift
//  BM
//
//  Created by NikitaSergeevich on 10/08/2022.
//

import Foundation

enum UsersEndpoint {
    case allUsers
}

extension UsersEndpoint: Endpoint {
    var schema: String {
        return ""
    }
    
    var header: [String : String]? {
        return nil
    }
    
    
    var path: String {
        switch self {
        case .allUsers: return "/api/users"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .allUsers: return .get
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .allUsers: return nil
        }
    }
    
   
}
