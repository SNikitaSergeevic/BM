//
//  registrationView.swift
//  BM
//
//  Created by NikitaSergeevich on 30/06/2022.
//

import SwiftUI
import CoreData

struct RegistrationView: View {

    @ObservedObject var viewModel: RegistrationViewModel
    
    init(viewModel: RegistrationViewModel) {
       
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack{
                
                Image("BMLogo")
                    .resizable()
                    .frame(width: 200, height: 100, alignment: .center)
                
                
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(GradientTextFieldBackground(systemImageString: "envelope", text: "Email"))
                    
                    TextField("Name", text: $viewModel.name)
                        .textFieldStyle(GradientTextFieldBackground(systemImageString: "envelope", text: "Name"))
                    
                    Picker("Choose a sex", selection: $viewModel.sex){
                        ForEach(viewModel.sexes, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    TextField("Password", text: $viewModel.password)
                        .textFieldStyle(GradientTextFieldBackground(systemImageString: "lock", text: "Password"))
                    
                    
                    TextField("PasswordRep", text: $viewModel.passwordRep)
                        .textFieldStyle(GradientTextFieldBackground(systemImageString: "lock", text: "Password repeat"))
                    
                    
                    
                    
                }
                .padding()
                
                
                Button("Register"){
                    print("button pressed")
                    Task{
                        try await viewModel.createUser()
                    }
                }
                .buttonStyle(ButtonRegister())
                VStack{
                    Text("or")
                    NavigationLink(destination: LoginView(viewModel: viewModel)) {
                        Text("Login")
                    }
                }
                Spacer()
            }
            .background(Color.BMBackground)
        }
    }
        
}

//struct RegistrationView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegistrationView(viewModel: RegistrationViewModel())
//    }
//}
