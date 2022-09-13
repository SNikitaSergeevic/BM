//
//  Record.swift
//  BM
//
//  Created by NikitaSergeevich on 06/07/2022.
//

import Foundation

struct Record {
    let id: UUID
    var adID: UUID
    var stafID: UUID
    var clientID: UUID
    var meetDate: Date
//    var time: Date
    var meetAdress: String
    var completionMark: Bool
    var createdAt: Date
    var updatedAt: Date
}

/*
  
 MARK: - MODEL
 
 
 init(id: UUID? = nil,
      createdAt: Date? = nil,
      updatedAt: Date? = nil,
      adID: Ad.IDValue,
      client: User.IDValue,
      staf: User.IDValue,
      meetDate: Date? = nil,
      meetAdress: String
 ){
     self.id = id
     self.createdAt = createdAt
     self.updatedAt = updatedAt
     self.$ad.id = adID
     self.$client.id = client
     self.$staf.id = staf
     self.meetAdress = meetAdress
 }
 
 
 */
