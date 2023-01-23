//
//  PublicUser.swift
//  BM
//
//  Created by NikitaSergeevich on 09/12/2022.
//

import Foundation

struct UserPublic: Codable, Hashable {
    let id: UUID?
    let name: String
    let profilePicture: String?
    let createdAt: Date?
    let grade: Double
    let sex: String
	let ads: [Ad]
    // add all ads and records
	init(id: UUID?,
		 name: String,
		 profilePicture: String?,
		 createdAt: Date?,
		 grade: Double,
		 sex: String,
		 ads: [Ad] = []) {
		self.id = id
		self.name = name
		self.profilePicture = profilePicture
		self.createdAt = createdAt
		self.grade = grade
		self.sex = sex
		self.ads = ads
	}
    
}

struct UserPublicResult: Codable {
	let path: [UserPublic]
	
	enum CodingKeys: String, CodingKey {
		case path = ""
	}
	
}
