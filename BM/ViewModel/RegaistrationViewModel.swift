//
//  RegaistrationViewModel.swift
//  BM
//
//  Created by NikitaSergeevich on 24/10/2022.
//

import Foundation
import SwiftUI

class RegistrationViewModel: ObservableObject {
    @State var service = UserService()
    
    func createUser(_ user: User) async throws -> Void{
        try await service.createUser(user)
    }
    
}
