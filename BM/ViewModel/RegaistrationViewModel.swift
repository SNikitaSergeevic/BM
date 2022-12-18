//
//  RegaistrationViewModel.swift
//  BM
//
//  Created by NikitaSergeevich on 24/10/2022.
//

import Foundation
import SwiftUI
import CoreData

class RegistrationViewModel: ObservableObject {
    
    var auth: Authorisation = Authorisation()
    
    init(){
        print("RegistrationViewModel init")
    }

    
    @State var service = UserService()
    @Published var checkName = false
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var passwordRep = ""
    @Published var phoneNumber = ""
    @Published var sex = ""
    @Published var sexes: [String] = ["male", "famale"]
    
    func createUser() async throws -> Void{
        let user = UserSelf(name: name, email: email, phoneNumber: phoneNumber, password: password, sex: sex)
        try await service.createUser(user)
    }

    
    
    
    
    
}
