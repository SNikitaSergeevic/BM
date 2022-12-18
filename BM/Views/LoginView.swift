//
//  LoginView.swift
//  BM
//
//  Created by NikitaSergeevich on 02/11/2022.
//

import SwiftUI
import CoreData

struct LoginView: View {
    
    @ObservedObject var viewModel: RegistrationViewModel
    //MARK: All Environment values in one var
    @Environment(\.self) var env
    
    init(viewModel: RegistrationViewModel){
        print("LoginView init")
        self.viewModel = viewModel
    }
     
    var body: some View {
        NavigationView{
            VStack {
                Image("BMLogo")
                    .resizable()
                    .frame(width: 200, height: 100, alignment: .center)
                VStack {
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(GradientTextFieldBackground(systemImageString: "envelope", text: "Email"))
                    TextField("Password", text: $viewModel.password)
                        .textFieldStyle(GradientTextFieldBackground(systemImageString: "envelope", text: "Password"))
                    Button("Login"){
                        print("button pressed login")
                        Task{
                            try await viewModel.auth.loginEmail(user: UserSelf(name: "", email: viewModel.email, phoneNumber: "", password: viewModel.password, sex: ""))
                        }
                    }
                    .buttonStyle(ButtonRegister())
                    .padding()
                    
                    Button("CheckToken"){
                        print("button CheckToken pressed")
                        print("token isEmpty - \(viewModel.auth.checkIsEmptyToken())")
                    }
                    .buttonStyle(ButtonRegister())
                    .padding()
                    
                }
                .padding()
                Spacer()
            }
        }
        
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView(viewModel: LoginViewModel())
//    }
//}
