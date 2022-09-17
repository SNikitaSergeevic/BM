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
                    Text("me")
                }
                
                Spacer()
                HStack {
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .search, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "magnifyingglass", tabName: "Search")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .liked, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "heart", tabName: "Liked")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .add, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "plus", tabName: "Add")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .message, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "message", tabName: "Message")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .me, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "person", tabName: "Me")
                }
                .frame(width: geometry.size.width, height: geometry.size.height / 8)
                
                
            }
            .edgesIgnoringSafeArea(.bottom)
            
        }
        
    }
}

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    
    let width, height: CGFloat
    let  systemIconName, tabName: String
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
                
            Spacer()
        }
        .padding(.horizontal, -4)
        .foregroundColor( viewRouter.currentPage == assignedPage ? .blue.opacity(1) : .gray)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
    }
    
}   

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(viewRouter: ViewRouter())
    }
}
