//
//  TabBarView.swift
//  BM
//
//  Created by NikitaSergeevich on 17/09/2022.
//

import SwiftUI

struct TabBarView: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                    Spacer()
                    switch viewRouter.currentPage {
                    case .search :
                        SearchScreenView()
                    case .liked :
                        Text("Liked")
                    case .add :
                        Text("Add")
                    case .message :
                        Text("Message")
                    case .me :
                        MeView()
                    }
                Spacer()
            }
            .padding(.top, 40)
            .overlay(alignment: .bottomLeading) {
                    HStack {
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .search, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "magnifyingglass", tabName: "Search")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .liked, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "heart", tabName: "Liked")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .add, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "plus", tabName: "Add")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .message, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "message", tabName: "Message")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .me, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "person", tabName: "Me")
                    }
                    .background(.ultraThinMaterial)
                    .background(Color.blue.blur(radius: 30))
                    .cornerRadius(30)
                    .frame(width: geometry.size.width * 0.95, height: geometry.size.height / 14)
                    .padding([.leading, .bottom], 10)
                
            }
            .edgesIgnoringSafeArea(.vertical)
            
            
            
        }
        
    }
}

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    
    let width, height: CGFloat
    let  systemIconName, tabName: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.white.opacity(viewRouter.currentPage == assignedPage ? 1 : 0))
                .frame(width: 40)
                .blur(radius: 10)
                
            VStack(alignment: .center) {
                Image(systemName: systemIconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
                    .padding(.vertical, 10)
                
            }
            .foregroundColor( viewRouter.currentPage == assignedPage ? Color("LightPink") : .white)
            
        }
        .cornerRadius(10)
        .padding(.horizontal, -4)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
        .animation(.easeInOut, value: viewRouter.currentPage)
        
    }
    
}   

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(viewRouter: ViewRouter())
    }
}
