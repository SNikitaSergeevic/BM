//
//  SearchScreenView.swift
//  BM
//
//  Created by NikitaSergeevich on 13/09/2022.
//

import SwiftUI

struct SearchScreenView: View {
    
    
    @State private var column: [GridItem] = [GridItem(), GridItem()]
    
    var body: some View {

        ScrollView{
            LazyVGrid(columns: column){
                ForEach(0...100, id: \.self) { item in
                    SmallAdsView()
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
