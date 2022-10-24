//
//  AddAdsView.swift
//  BM
//
//  Created by NikitaSergeevich on 19/10/2022.
//

import SwiftUI

struct AddAdsView: View {
    
    @ObservedObject var viewModel: AddAdsViewModel
    
    var body: some View {
        VStack {
            
            Button {
                viewModel.isPresentCreateNewAd.toggle()
            } label: {
                HStack{
                    Spacer()
                    Text("add")
                    Image(systemName: "plus")
                        
                }
                .bold()
                .foregroundColor(Color("CBlue"))
                .padding(.horizontal)
                
            }
            
            HStack {
                Button {
                    if viewModel.isPresentActive {
                        
                    } else {
                        viewModel.isPresentActive.toggle()
                    }

                } label: {
                    Spacer()
                    Text("Active ads")
                        .foregroundColor(Color("CBlue"))
                    Spacer()
                }
                .background (.thinMaterial)
                .background(Color("CPink").opacity(viewModel.isPresentActive ? 1 : 0))
                .cornerRadius(5)
                
                Button {
                    if viewModel.isPresentActive {
                        viewModel.isPresentActive.toggle()
                    } else {
                        
                    }
                } label: {
                    HStack {
                        Spacer()
                        Text("Archive")
                            .foregroundColor(Color("CBlue"))
                        Spacer()
                    }
                }
                .background (.thinMaterial)
                .background(Color("CPink").opacity(viewModel.isPresentActive ? 0 : 1))
                .cornerRadius(5)
            }
            .font(.system(size: 18, weight: .medium, design: .serif))
            .frame(height: 30)
            .padding(.horizontal)
            Spacer()
            
            if viewModel.isPresentActive {
                VStack {
                    Text("ACTIVE")
                        .bold()
                        .font(.system(size: 40))
                }
            } else {
                
                VStack {
                    Text("ARCHIVE")
                        .bold()
                        .font(.system(size: 40))
                }
            }
            Spacer()
        }
        .popover(isPresented: $viewModel.isPresentCreateNewAd) {
            CreateNewAd()
        }
    }
}

struct CreateNewAd: View {
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Next") {
                    twoStep
                }
                firstStep
                
            }
        }
    }
    
    var firstStep: some View {
        Text("First step")
    }
    
    var twoStep: some View {
        VStack {
            NavigationLink("Next") {
                threeStep
            }
            Text("Two step")
            
        }
    }
    
    var threeStep: some View {
        VStack {
            NavigationLink("Next") {
                fourStep
            }
            Text("Three step")
            
        }
        
    }
    
    var fourStep: some View {
        Text("Four step")
    }
    
    
}

struct AddAdsView_Previews: PreviewProvider {
    static var previews: some View {
//        AddAdsView(viewModel: AddAdsViewModel())
        CreateNewAd()
    }
}
