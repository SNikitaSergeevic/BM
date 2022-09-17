//
//  SearchScreenView.swift
//  BM
//
//  Created by NikitaSergeevich on 13/09/2022.
//

import SwiftUI

struct SearchScreenView: View {
    
    
    @State private var column: [GridItem] = [GridItem(), GridItem()]
    @State private var ads: [Ad] = [DefaultDatas.defaultAd1, DefaultDatas.defaultAd2]
    
    var body: some View {

        ScrollView{
            LazyVGrid(columns: column){
                ForEach(ads, id: \.self) { item in
                    SmallAdsView(ad: item)
                }
            }
        }
        
    }
}

struct SearchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreenView()
    }
}
