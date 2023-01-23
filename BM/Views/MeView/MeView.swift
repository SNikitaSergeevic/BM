//
//  MeView.swift
//  BM
//
//  Created by NikitaSergeevich on 05/10/2022.
//

import SwiftUI

struct MeView: View {
    
    @State var isPresentCalendar = false
    
    @ObservedObject var viewModel: MeViewModel
    
    
    var body: some View {
//        var userSelf = viewModel.authorisation.userSelf
                VStack {
                    
                    UserMainView(userImage: viewModel.userImage,
                                 userName: viewModel.userSelf.name,
                                 userGrade: viewModel.userSelf.grade,
                                 userWithUs: "\(viewModel.userSelf.createdAt)")
                        .environmentObject(viewModel)
                       Divider()
                    myWork
                        .padding(5)
                    
                    myPurchase
                        .padding(5)
                    
                    settings
                        .padding(5)
                    
                    Spacer()
                    
                    Button {
                        viewModel.getSelfToken()
//                        print(userSelf)
                    } label: {
                        Text("Check self token")
                    }
                    Spacer()
                    
                }
                .opacity(1)
                .onAppear{
					Task {
						try await viewModel.getSelfUser()
					}
                    print("meView onApppear", viewModel.userSelf.name)
                }

        
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
                .background(Color(.systemPink).opacity(0.05))
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
                .background(Color(.systemPink).opacity(0.05))
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
                .background(Color(.systemPink).opacity(0.05))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            Spacer()
        }
    }
    
    init(viewModel: MeViewModel) {
        self.viewModel = viewModel
        
        print("MeView init")
    }
    
    
}

struct UserMainView: View {
    @EnvironmentObject var viewModel: MeViewModel
    
    @State var isPresentChangeUserInfo = false
    
    var userImage: UIImage
    var userName: String
    var userGrade: Double
    var userWithUs: String
    
    @State var name = "enter name"
    
    
    var body: some View {
        VStack(alignment: .trailing) {
            
            HStack {
                userIcon
                    .frame(width: 60, height: 60)
                    .padding(5)
                userInformation
                Spacer()
            }
            
        }
//        .padding(.top)
//        .edgesIgnoringSafeArea(.top)
        
    }
    
    var userIcon: some View {
        VStack(spacing: 0) {
            ZStack {
                //            Image(uiImage: userImage)
//				if let data = userImage, let uiImage = UIImage(data: data) {
					Image(uiImage: userImage)
						.resizable()
						.scaledToFill()
						.padding(.vertical, -10)
//				}
                
                Circle()
                    .stroke(lineWidth: 3)
                    .foregroundColor(.gray)
                
            }
            .clipShape(Circle())
            .padding(0)
            Button{
                isPresentChangeUserInfo.toggle()
            } label: {
                HStack(spacing: 0){
                    Text("edit")
                        .font(.subheadline)
                    Image(systemName: "pencil")
                        .font(.footnote)
                        .bold()
                }
                .foregroundColor(.gray)
            }
            .padding(0)
            .popover(isPresented: $isPresentChangeUserInfo){
				EditUserInfoView(name: userName, data: viewModel.userImage)
            }
        }
    }
    
    var userInformation: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(viewModel.userSelf.name)
                Spacer()
                Text("\(userGrade, specifier: "%.1f")")
                Image(systemName:"star.fill")
                    .foregroundColor(.orange)
            }
            .font(.title3)
            Text(userWithUs)
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




//struct MeView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        MeView(viewModel: MeViewModel(viewRouter: ViewRouter(), userSelf: UserSelf()))
//    }
//}
