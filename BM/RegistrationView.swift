//
//  registrationView.swift
//  BM
//
//  Created by NikitaSergeevich on 30/06/2022.
//

import SwiftUI

struct RegistrationView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordRep: String = ""
    
    
    var body: some View {
        VStack{
            Spacer()
            Text(name)
            
            Spacer()
            TextField("Name", text: $name)
            TextField("Email", text: $email)
            TextField("Password", text: $password)
            TextField("PasswordRep", text: $passwordRep)

            
            
            Button(action: {
                print("button tap")
            }){
                Text("First button")
            }
            Spacer()
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
