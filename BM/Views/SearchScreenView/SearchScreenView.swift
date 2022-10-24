//
//  SearchScreenView.swift
//  BM
//
//  Created by NikitaSergeevich on 13/09/2022.
//

import SwiftUI

struct SearchScreenView: View {
    
    
    @State private var column: [GridItem] = [GridItem(), GridItem()]
    @ObservedObject var viewModel: SearchScreenViewModel
    
    var body: some View {
        
        VStack {
            
            ScrollView{
                LazyVGrid(columns: column){
                    ForEach(0...20, id: \.self) { item in
                        
                        SmallAdsView(ad: viewModel.ads[1])
                            .onTapGesture {
                                //shit change on privat func in viewModel
                                viewModel.isPresent.toggle()
                            }
                        
                    }
                }
                .padding(.top, 100)
                .edgesIgnoringSafeArea(.top)
            }
            .edgesIgnoringSafeArea(.top)
        }
        .overlay(alignment: .top) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .opacity(0.6)
                    .background(.regularMaterial)
                    .background(Color("LightPink").opacity(0.9))
                    .cornerRadius(30)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.white)
                        .font(.system(size: 22, weight: .bold))
                    TextField("...", text: $viewModel.serachText, prompt: Text("Search..."))
                        .foregroundColor(.black)
                        .frame(height: 30)
                        .background(Color.white)
                        .cornerRadius(20)
                }
                .foregroundColor(.gray)
                .padding(.horizontal, 5)
            }
            .frame(height: 40)
            .padding(.horizontal, 5)
        }
        .popover(isPresented: $viewModel.isPresent) {
            AdFullView()
        }
    }
}

struct SearchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreenView(viewModel: SearchScreenViewModel())
    }
}
