//
//  TestView.swift
//  BM
//
//  Created by NikitaSergeevich on 10/08/2022.
//

import SwiftUI

struct TestView: View {
    @State var service = UserService()
    @State var users: [User] = []
    
    var body: some View {
        VStack {
            if users.count > 0 {
                Text("\(users[0].name)")
                Text("\(users[0].email)")
                Text("\(users[0].password)")
            } else {
                Text("\(users.count)")
            }
        }
        .onAppear(){
            Task{
                await users = try service.getUsers()
            }
        }
        
    }
    
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
