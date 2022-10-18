//
//  MeView.swift
//  BM
//
//  Created by NikitaSergeevich on 05/10/2022.
//

import SwiftUI

struct MeView: View {
    
    @State var isPresentCalendar = false
    
    
    var body: some View {
                VStack {
                    
                    UserMainView()
                       Divider()
                    myWork
                        .padding(5)
                    
                    myPurchase
                        .padding(5)
                    
                    settings
                        .padding(5)
                    
                    Spacer()
                    
                }
                .opacity(1)

        
    }
    
    var myWork: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("My work")
                    .font(.system(size: 22, weight: .semibold, design: .serif))
                VStack {
                    
                    Button {
                        isPresentCalendar.toggle()
                    } label: {
                        MenuSection{
                            Text("Calendar")
                        }
                        .padding(.horizontal)
                    }
                    .foregroundColor(.black)
                    .popover(isPresented: $isPresentCalendar) {
                        CalendarUserSetting()
                    }
                    
                    Divider()
                        .padding(.horizontal)
                    
                    MenuSection{
                        Text("Reviews")
                    }
                    .padding(.horizontal)
                }
                .background(Color(.systemPink).opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            Spacer()
        }
        
    }
    
    var myPurchase: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("My purchases")
                    .font(.system(size: 22, weight: .semibold, design: .serif))
                VStack {
                    MenuSection{
                        Text("Records calendar")
                    }
                    .padding(.horizontal)
                    
                }
                .background(Color(.systemPink).opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            Spacer()
        }
    }
    
    var settings: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("Settings")
                    .font(.system(size: 22, weight: .semibold, design: .serif))
                VStack {
                    MenuSection{
                        Text("Profile settings")
                    }
                    .padding(.horizontal)
                    
                    Divider()
                        .padding(.horizontal)
                    
                    MenuSection{
                        Text("App settings")
                    }
                    .padding(.horizontal)
                }
                .background(Color(.systemPink).opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            Spacer()
        }
    }
    
}

struct UserMainView: View {
    var body: some View {
        HStack {
            userIcon
                .frame(width: 60, height: 60)
                .padding(5)
            userInformation
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
        .padding(.top)
        
        
    }
    
    var userIcon: some View {
        ZStack {
            Image("testP")
                .resizable()
                .scaledToFill()
                
            Circle()
                .stroke(lineWidth: 3)
                .foregroundColor(.gray)
                
        }
        .clipShape(Circle())
    }
    
    var userInformation: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Elena")
                    .font(.title)
                    .bold()
                Spacer()
                Text("5.0")
                    .font(.title3)
                Image(systemName:"star.fill")
                    .font(.title3)
                    .foregroundColor(.orange)
            }
            Text("with us: 20.10.2022")
                .font(.caption2)
        }
    }
    
}


struct MenuSection<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                content
                    .font(.system(size: 20, weight: .light, design: .serif))
                Spacer()
                Image(systemName: "chevron.right")
                    .padding(.vertical)
            }
        }
    }

    
}




struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
