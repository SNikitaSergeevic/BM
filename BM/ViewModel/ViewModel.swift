//
//  ViewModel.swift
//  BM
//
//  Created by NikitaSergeevich on 06/07/2022.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var experimentText = "ExprimentalText"
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordRep: String = ""
}
