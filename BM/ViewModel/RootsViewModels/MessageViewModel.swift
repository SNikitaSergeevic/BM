//
//  MessageViewModel.swift
//  BM
//
//  Created by NikitaSergeevich on 12/12/2022.
//

import Foundation
import SwiftUI

class MessageViewModel: ObservableObject {
    @ObservedObject var viewRouter: ViewRouter
    
    init(viewRouter: ViewRouter) {
        self.viewRouter = viewRouter
    }
}
