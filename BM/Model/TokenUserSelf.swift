//
//  TokenSelfUser.swift
//  BM
//
//  Created by NikitaSergeevich on 05/11/2022.
//

import Foundation

struct TokenUserSelf: Hashable, Codable {
    
//    let path: [TokenUserSelf]
    var value: String
    var user: TokenUserSelf.User
    
    
    enum CodingKeys: CodingKey {
//        case path
        case value
        case user
    }
    
    struct User:Hashable, Codable {
       var id: String
    }
    
    
    
    
}
