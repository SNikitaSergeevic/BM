//
//  LoginViewModel.swift
//  BM
//
//  Created by NikitaSergeevich on 02/11/2022.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @State var service = Authorisation()
    
    @Published var email: String = ""
    @Published var password: String = ""
    
}
