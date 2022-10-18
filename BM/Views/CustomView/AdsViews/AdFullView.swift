//
//  AdFullView.swift
//  BM
//
//  Created by NikitaSergeevich on 19/09/2022.
//

import SwiftUI

struct AdFullView: View {
    
    var ad: Ad = DefaultDatas.defaultAd1
    var images = [Image("testP"), Image("testP"), Image("testP"), Image("testP")]
    var id = [0,1,2,3]
    @State var index = 0
    @State var subscribeOpen = false
    var subscribeMenuHeight = UIScreen.main.bounds.size.height * 0.45
    
    var body: some View {
        VStack {
            ScrollView {
// MARK: ad images
                HStack {
                    TabView{
                        ForEach(self.id, id: \.self) { item in
                            ZStack {
                                GeometryReader { geometry in
                                    images[item]
                                        .resizable()
                                        .scaledToFill()
                                        .blur(radius: 80)
                                        .frame(maxHeight: 350)
                                }
                                VStack {
                                    images[item]
                                        .resizable()
                                        .scaledToFit()
                                }
                                .frame(maxHeight: 350)
                                
                            }
                            .frame(maxHeight: 350)
                        }
                    }
                    .frame(minHeight: 300, maxHeight: 350)
                    .tabViewStyle(.page)
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                }
// MARK: information about ad
                VStack {
                    Text(ad.title)
                        .font(.title3)
                    
                    HStack{
                        Text("price:")
                        Text(ad.price)
                            .font(.title2)
                        Spacer()
                    }
                    .padding([.top, .leading])
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("description: ")
                        Text(ad.description)
                            .lineLimit(20)
                            .font(.title3)
                    }
                    .padding(.leading)
                    
                    Divider()
                    HStack {
                        Text(ad.userID.name)
                        Spacer()
                        Text("grade: \(ad.userID.grade)")
                        
                    }
                    .padding([.leading, .trailing])
                    
                    Divider()
                    
                    HStack() {
                        Text("12 february 2022")
                            .font(.caption)
                        Spacer()
                    }
                    .padding(.leading)
                    
                }
            }
        }
        .overlay(alignment: .bottom) {
            // MARK: record button and calendar
            GeometryReader { geometry in
                HStack(alignment: .center) {
                    Spacer()
                    ZStack {
                        VStack(){
                            Spacer()
                        }
                        .background(Color(.blue))
                        VStack {
                            HStack {
                                Text("Запись")
                                if subscribeOpen {
                                    Image(systemName: "chevron.right" )
                                    
                                }
                                
                            }
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(subscribeOpen ? Color("CBlue") : .white)
                            .frame( maxWidth: 100,  maxHeight: 40)
                            .onTapGesture {
                                subscribeOpen.toggle()
                            }
                            if subscribeOpen {
                                CalendarFullAd()
                            }
                        }
                        .background(subscribeOpen ? Color("CPurple").opacity(0.1) : Color("CBlue").opacity(0.9))
                        .cornerRadius(20)
                        .padding(4)
                        .animation(.easeOut, value: subscribeOpen)
                    }
                    .background(.thinMaterial)
                    .background(subscribeOpen ? Color("CPurple").opacity(0.5) : Color("CGreen").opacity(0.5))
                    .cornerRadius(20)
                    .animation(.easeOut, value: subscribeOpen)
                    .padding(4)
                }
            }
        }
    }
}

struct AdFullView_Previews: PreviewProvider {
    static var previews: some View {
        AdFullView()
    }
}




