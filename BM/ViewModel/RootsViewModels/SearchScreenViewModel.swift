//
//  SearchScreenViewModel.swift
//  BM
//
//  Created by NikitaSergeevich on 24/10/2022.
//

import Foundation
import SwiftUI

class SearchScreenViewModel: ObservableObject {
    
    @ObservedObject var viewRouter: ViewRouter = ViewRouter()
    
    @Published var ads: [Ad] = [DefaultDatas.defaultAd1, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2]
    @Published var serachText: String = ""
    @Published var isPresent: Bool = false
    
    init(viewRouter: ViewRouter) {
        self.viewRouter = viewRouter
    }
    
}
