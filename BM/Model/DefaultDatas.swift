//
//  DefaultData.swift
//  BM
//
//  Created by NikitaSergeevich on 13/09/2022.
//

import Foundation

struct DefaultDatas {
    
    static var defaultUser1: UserSelf = UserSelf(id: UUID(uuidString: "B1540938-DF74-4333-8017-585F4151C164"),
                                 createdAt: Date(timeIntervalSince1970: 99938498),
                                 updatedAt: Date(timeIntervalSince1970: 99938498),
                                 name: "Nikita",
                                 email: "nikitoskasys@gmail.com",
                                 phoneNumber: "+79539475474",
                                 password: "1234567",
                                 grade: 0.0,
                                 sex: "male")
    static var defaultUser2: UserSelf = UserSelf(id: UUID(uuidString: "B1540938-DF74-4333-8017-585F4151C155"),
                                  createdAt: Date(timeIntervalSince1970: 999384982),
                                  updatedAt: Date(timeIntervalSince1970: 999384982),
                                  name: "Elena",
                                  email: "elena@gmail.com",
                                  phoneNumber: "+79127206365",
                                  password: "1234567",
                                  grade: 0.0,
                                  sex: "famale")
    
    static var defaultUserPublic: UserPublic = UserPublic(id: UUID(uuidString: "ACAF6123-269B-4AB6-AEC0-2A388A3896C5"),
                                                          name: "Nikita",
                                                          profilePicture: nil,
                                                          createdAt: Date(timeIntervalSince1970: 999384992),
                                                          grade: 0,
                                                          sex: "male")
    
//    var id: UUID?
//    var name: String
//    var profilePicture: String?
//    var createdAt: Date?
//    var grade: Double
//    var sex: String
    
    static var defaultAd1: Ad = Ad(id: UUID(uuidString: "B1540938-DF74-4333-8020-585F4151C133"),
                            createdAt: Date(timeIntervalSince1970: 999384992),
                            updatedAt: Date(timeIntervalSince1970: 999384992),
                            user: defaultUserPublic,
                            title: "Nail bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla",
                            description: "Anythink description for perfecte salle this ad Anythink description for perfecte salle this ad. Anythink description for perfecte salle this ad. Anythink description for perfecte salle this ad.",
                            address: "Lenin 162",
                            whoClient: "famale",
                            price: "1000")
    
   static var defaultAd2: Ad = Ad(id: UUID(uuidString: "B1540938-DF74-4333-8090-585F4151C188"),
                            createdAt: Date(timeIntervalSince1970: 999384989),
                            updatedAt: Date(timeIntervalSince1970: 999384989),
                            user: defaultUserPublic,
                            title: "Lush bla bla bla bla bla bla bla bla",
                            description: "Anythink description for perfecte salle this ad.",
                            address: "Gorkogo 2",
                            whoClient: "famale",
                            price: "800")
    
}
