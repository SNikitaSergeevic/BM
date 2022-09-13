//
//  User.swift
//  BM
//
//  Created by NikitaSergeevich on 06/07/2022.
//

import Foundation

//MARK: User model in DB
/*
 id: UUID? = nil,
 createdAt: Date? = nil,
 updatedAt: Date? = nil,
 name: String,
 email: String,
 phoneNumber: String,
 password: String,
 grade: Double = 0.0,
 sex: String
 */



struct User: Codable, Hashable {
    //    let id: Int
    //    var name: String
    //    var email: String
    //    var password: String
    //    var dateRegistrtion: Date
    //    var adsID: [Int]
    //    var gradeUser: Int
    //    var photoAvatar: Data
    //    var aboutUser: String
    //    var trustedEmail: Bool
    //    var phoneNumber: Int
    //    var sex: String
    //    var personCategory: String // private person or buisness
    //    var favoriiteAds: [Int]
    
    let id: UUID?
    let updatedAt: Date?
    let createdAt: Date?
    let name: String
    let email: String
    let phoneNumber: String
    let password: String
    let grade: Double
    let sex: String
    
    
    init(id: UUID? = nil,
         createdAt: Date? = nil,
         updatedAt: Date? = nil,
         name: String,
         email: String,
         phoneNumber: String,
         password: String,
         grade: Double = 0.0,
         sex: String) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.email = email
        self.phoneNumber = phoneNumber
        self.password = password
        self.grade = grade
        self.sex = sex
        //        self.avatar = avatar
        self.name = name
    }
}

struct UserResult: Codable {
    let path: [User]
    
    enum CodingKeys: String, CodingKey {
        case path = ""
    }
    
}

struct UserCreate: Codable, Hashable {
    let name: String
    let email: String
    let phoneNumber: String
    let password: String
    let grade: Double
    let sex: String
}

//[
//    {
//        "password": "16710985",
//        "id": "B1540938-DF74-4333-8017-585F4151C164",
//        "grade": 0,
//        "email": "nikitoskasys@gmail.com",
//        "updatedAt": "2022-08-06T00:00:00Z",
//        "createdAt": "2022-08-06T00:00:00Z",
//        "sex": "male",
//        "name": "Nikita",
//        "phoneNumber": "+79539475474"
//    }
//]



