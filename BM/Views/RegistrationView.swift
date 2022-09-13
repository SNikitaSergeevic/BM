//
//  registrationView.swift
//  BM
//
//  Created by NikitaSergeevich on 30/06/2022.
//

import SwiftUI

struct RegistrationView: View {
    @ObservedObject var viewModel: RegistrationViewModel
    @State var checkName = false
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var passwordRep = ""
    @State private var phoneNumber = ""
    @State private var sex = ""
    @State private var sexes: [String] = ["male", "famale"]
    
    
    
    var body: some View {
        VStack{
            
            Image("BMLogo")
                .resizable()
                .frame(width: 200, height: 100, alignment: .center)
            
            
            
            VStack(alignment: .leading, spacing: 0) {
                
                TextField("Name", text: $name)
                    .textFieldStyle(GradientTextFieldBackground(systemImageString: "person"))
                
                if checkName {
                    Text("Text with warning")
                        .warningText()
                }
                
                TextField("Email", text: $email)
                    .textFieldStyle(GradientTextFieldBackground(systemImageString: "envelope"))
                
                TextField("Phone number", text: $phoneNumber)
                    .textFieldStyle(GradientTextFieldBackground(systemImageString: "phone"))
                
                Picker("Choose a sex", selection: $sex){
                    ForEach(sexes, id: \.self){
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                TextField("Password", text: $password)
                    .textFieldStyle(GradientTextFieldBackground(systemImageString: "lock"))
                
                TextField("PasswordRep", text: $passwordRep)
                    .textFieldStyle(GradientTextFieldBackground(systemImageString: "lock"))
                
                
                
                
            }
            .padding()
            
            
            Button("Register"){
                print("button pressed")
//                print(name, email, password, phoneNumber, sex)
                Task{
                    try await viewModel.createUser(User(name: name, email: email, phoneNumber: phoneNumber, password: password, grade: 0.0, sex: sex))
                }
            }
            .buttonStyle(ButtonRegister())
            
            Spacer()
        }
        .background(Color.BMBackground)
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(viewModel: RegistrationViewModel())
    }
}
