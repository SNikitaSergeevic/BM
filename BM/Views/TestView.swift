//
//  TestView.swift
//  BM
//
//  Created by NikitaSergeevich on 10/08/2022.
//

import SwiftUI

enum TestedViews: String {
    case allUsers
    case createdUser
}

struct TestView: View {
    @State var service = UserService()
    @State private var users: [User] = []
    @State private var allView: [TestedViews] = [.allUsers, .createdUser]
//    @State private var currentView: TestedViews = .allUsers
    
    var body: some View {
        //        VStack {
        //
        //            Button{
        //
        //            }label:{
        //
        //            }
        //
        //            if users.count > 0 {
        //                Text("\(users[0].name)")
        //                Text("\(users[0].email)")
        //                Text("\(users[0].password)")
        //            } else {
        //                Text("\(users.count)")
        //            }
        //        }
        //        .onAppear(){
        //            Task{
        ////                let result = await service.getAllUsers()
        ////                switch result {
        ////                case .success(let userResponse):
        ////                    users = userResponse
        ////                case .failure(let error):
        ////                    print("onAppear error", error.customMessage)
        ////                }
        //            users = try await service.getAllUsers()
        //
        //            }
        //        }
        NavigationView {
            List{
                ForEach(allView, id: \.self) { item in
                    NavigationLink(item.rawValue){switch item {
                    case .allUsers:
                        allUsersView
                            .onAppear(){
                                Task{
                                    users = try await service.getAllUsers()
                                }
                            }
                    case .createdUser:
                        createUser
                    }}
                }
                
            }
        }
    }
    
    var allUsersView: some View {
        List{
            ForEach(users, id: \.self){ user in
                VStack(alignment: .leading, spacing: 0){
                    Text(user.name)
                        .font(.title3)
                    Text(user.email)
                        .font(.body)
                    Text(user.id!.uuidString)
                        .font(.caption)
                }
            }
            .onDelete(perform: deleteUser)
        }
        
    }
    
    var createUser: some View {
        RegistrationView(viewModel: RegistrationViewModel())
    }
    
    func deleteUser(at offsets: IndexSet){
        let index = offsets[offsets.startIndex]
        print(users[index].name)
        Task {
            try await service.deleteUser(userID: users[index].id!.uuidString)
            users.remove(atOffsets: offsets)
        }
        
        
        
    }
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView().createUser
    }
}
