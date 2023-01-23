//
//  File.swift
//  BM
//
//  Created by NikitaSergeevich on 06/07/2022.
//

import Foundation

// MARK: Ad model in DB
/*
 id: UUID? = nil,
 createdAt: Date? = nil,
 updatedAt: Date? = nil,
 userID: User.IDValue,
 title: String,
 description: String,
 address: String,
 whoClient: String,
 price: String
 */

struct Ad: Codable, Hashable {
    //    let id: Int
    //    var nameAds: String
    //    var idOwner: Int
    //    var description: String
    //    var mainPic: Data
    //    var otherPicID: [String]
    //    var adress: String
    //    var category: String
    //    var type: String
    //    var meetPoint: String // salon or home
    //    var whoClient: String // male or famale
    //    var price: Int
    //    var createDate: Date
    
    let id: UUID?
    var createdAt: Date?
    var updatedAt: Date?
    var user: UserPublic
    var title: String
    var description: String
    var address: String
    var whoClient: String
    var price: String
    
}

struct adsPic {
    let id: Int
    var pic: Data
    var createDate: Date
}
