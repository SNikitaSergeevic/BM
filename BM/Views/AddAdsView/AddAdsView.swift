//
//  AddAdsView.swift
//  BM
//
//  Created by NikitaSergeevich on 19/10/2022.
//

import SwiftUI

struct AddAdsView: View {
    
    @State var isPresentActive = true
    
    var body: some View {
        VStack {
            
            HStack{
                Spacer()
                Text("add")
                Image(systemName: "plus")
            }
            .padding(.horizontal)
            
            HStack {
                Button {
                    if isPresentActive {
                        
                    } else {
                        isPresentActive.toggle()
                    }
                } label: {
                    Spacer()
                    Text("Active ads")
//                        .font(.system(size: 20, weight: .medium, design: .serif))
                    Spacer()
                }
                .background (.thinMaterial)
                .background(Color("CPink").opacity(isPresentActive ? 1 : 0))
                .cornerRadius(5)
                
                Button {
                    if isPresentActive {
                        isPresentActive.toggle()
                    } else {
                        
                    }
                } label: {
                    HStack {
                        Spacer()
                        Text("Archive ads")
//                            .font(.system(size: 20, weight: .medium, design: .serif))
                        Spacer()
                    }
                }
                .background (.thinMaterial)
                .background(Color("CPink").opacity(isPresentActive ? 0 : 1))
                .cornerRadius(5)
            }
            .font(.system(size: 18, weight: .medium, design: .serif))
            .frame(height: 30)
            .padding(.horizontal)
            Spacer()
            
            if isPresentActive {
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
    }
}

struct AddAdsView_Previews: PreviewProvider {
    static var previews: some View {
        AddAdsView()
    }
}
