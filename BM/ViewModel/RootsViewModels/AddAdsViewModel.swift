//
//  AddAdsViewModel.swift
//  BM
//
//  Created by NikitaSergeevich on 24/10/2022.
//

import Foundation
import SwiftUI

class AddAdsViewModel: ObservableObject {
    @Published var isPresentActive = true
    @Published var isPresentCreateNewAd = false
    
    @ObservedObject var viewRouter: ViewRouter
    
    init(viewRouter: ViewRouter) {
        self.viewRouter = viewRouter
    }
    
}
