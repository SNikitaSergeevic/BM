//
//  PublicUser.swift
//  BM
//
//  Created by NikitaSergeevich on 09/12/2022.
//

import Foundation

struct UserPublic: Codable, Hashable {
    var id: UUID?
    var name: String
    var profilePicture: String?
    var createdAt: Date?
    var grade: Double
    var sex: String
    // add all ads and records
    
    struct UserPublicResult: Codable {
        let path: [UserPublic]
        
        enum CodingKeys: String, CodingKey {
            case path = ""
        }
        
    }
}
