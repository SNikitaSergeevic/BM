//
//  LikeViewModel.swift
//  BM
//
//  Created by NikitaSergeevich on 06/07/2022.
//

import Foundation
import SwiftUI

class LikeViewModel: ObservableObject {
    @Published var ads: [Ad] = [DefaultDatas.defaultAd1, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2, DefaultDatas.defaultAd2]
    @Published var serachText: String = ""
}
