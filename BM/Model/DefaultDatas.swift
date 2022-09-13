//
//  DefaultData.swift
//  BM
//
//  Created by NikitaSergeevich on 13/09/2022.
//

import Foundation

struct DefaultDatas {
    
    static var defaultUser1: User = User(id: UUID(uuidString: "B1540938-DF74-4333-8017-585F4151C164"),
                                 createdAt: Date(timeIntervalSince1970: 99938498),
                                 updatedAt: Date(timeIntervalSince1970: 99938498),
                                 name: "Nikita",
                                 email: "nikitoskasys@gmail.com",
                                 phoneNumber: "+79539475474",
                                 password: "1234567",
                                 grade: 0.0,
                                 sex: "male")
    static var defaultUser2: User = User(id: UUID(uuidString: "B1540938-DF74-4333-8017-585F4151C155"),
                                  createdAt: Date(timeIntervalSince1970: 999384982),
                                  updatedAt: Date(timeIntervalSince1970: 999384982),
                                  name: "Elena",
                                  email: "elena@gmail.com",
                                  phoneNumber: "+79127206365",
                                  password: "1234567",
                                  grade: 0.0,
                                  sex: "famale")
    
    var defaultAd1: Ad = Ad(id: UUID(uuidString: "B1540938-DF74-4333-8020-585F4151C133"),
                            createdAt: Date(timeIntervalSince1970: 999384992),
                            updatedAt: Date(timeIntervalSince1970: 999384992),
                            userID: defaultUser2,
                            title: "Nail bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla",
                            description: "Anythink description for perfecte salle this ad.",
                            address: "Lenin 162",
                            whoClient: "famale",
                            price: "1000")
    
    var defaultAd2: Ad = Ad(id: UUID(uuidString: "B1540938-DF74-4333-8090-585F4151C188"),
                            createdAt: Date(timeIntervalSince1970: 999384989),
                            updatedAt: Date(timeIntervalSince1970: 999384989),
                            userID: defaultUser1,
                            title: "Lush bla bla bla bla bla bla bla bla",
                            description: "Anythink description for perfecte salle this ad.",
                            address: "Gorkogo 2",
                            whoClient: "famale",
                            price: "800")
    
}
