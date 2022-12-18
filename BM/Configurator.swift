//
//  Configurator.swift
//  BM
//
//  Created by NikitaSergeevich on 13/12/2022.
//

import Foundation
import SwiftUI

class Configurator: ObservableObject {
    @ObservedObject var authorisation: Authorisation

    @ObservedObject var viewRouter: ViewRouter
    
    @ObservedObject var searchScreenViewModel: SearchScreenViewModel
    @ObservedObject var meViewModel: MeViewModel
    @ObservedObject var addAdsViewModel: AddAdsViewModel
    @ObservedObject var likeViewModel: LikeViewModel
    @ObservedObject var messageViewModel: MessageViewModel
    @ObservedObject var registrationViewModel: RegistrationViewModel
    
    
    init(viewRouter: ViewRouter, authorisation: Authorisation) {
        
        Task {
            do {
                try await authorisation.authorisedUserWithToken()
                print("configurator" ,#function, authorisation.userSelf.name)
            } catch {
                print("MeView Init error", error.localizedDescription)
            }
        }
        self.viewRouter = viewRouter
        self.authorisation = authorisation
        self.searchScreenViewModel = SearchScreenViewModel(viewRouter: viewRouter)
        self.meViewModel = MeViewModel(viewRouter: viewRouter, authorisation: authorisation)
        self.addAdsViewModel = AddAdsViewModel(viewRouter: viewRouter)
        self.likeViewModel = LikeViewModel(viewRouter: viewRouter)
        self.messageViewModel = MessageViewModel(viewRouter: viewRouter)
        self.registrationViewModel = RegistrationViewModel()
        print("configurator init")
    }
}
