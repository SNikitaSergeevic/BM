//
//  ViewRouter.swift
//  BM
//
//  Created by NikitaSergeevich on 17/09/2022.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .search
    @Published var testViewModel: TestViewModel = TestViewModel()
    @Published var meViewModel: MeViewModel = MeViewModel()
    @Published var addAdsViewModel: AddAdsViewModel = AddAdsViewModel()
    @Published var likeViewModel: LikeViewModel = LikeViewModel()
    @Published var searchScreenViewModel: SearchScreenViewModel = SearchScreenViewModel()
}

enum Page {
    case search
    case liked
    case add
    case message
    case me
    
    var descriptin: String {
        switch self {
        case .search:
            return "Search"
        case .liked:
            return "liked"
        case .add:
            return "add"
        case .message:
            return "message"
        case .me:
            return "me"
        }
    }
    
}

