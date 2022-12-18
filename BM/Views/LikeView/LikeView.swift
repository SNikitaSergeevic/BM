//
//  LikeView.swift
//  BM
//
//  Created by NikitaSergeevich on 09/10/2022.
//

import SwiftUI

struct LikeView: View {
    
    @State private var column: [GridItem] = [GridItem(), GridItem()]
    @ObservedObject var viewModel: LikeViewModel 
    
    var body: some View {
        VStack {
            
            
            
            ScrollView{
                LazyVGrid(columns: column){
                    ForEach(0...1, id: \.self) { item in
                        SmallAdsView(ad: viewModel.ads[1])
                    }
                }
                .padding(.top, 100)
                .edgesIgnoringSafeArea(.top)
            }
            .edgesIgnoringSafeArea(.top)
            
            
            
        }
    }
}

//struct LikeView_Previews: PreviewProvider {
//    static var previews: some View {
//        LikeView(viewModel: LikeViewModel())
//    }
//}
