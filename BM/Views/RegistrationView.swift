//
//  registrationView.swift
//  BM
//
//  Created by NikitaSergeevich on 30/06/2022.
//

import SwiftUI

struct RegistrationView: View {
    @ObservedObject var viewModel: ViewModel
    @State var checkName = false
    
    
    var body: some View {
        VStack{
            
            Image("BMLogo")
                .resizable()
                .frame(width: 200, height: 100, alignment: .center)
                
            
            
            VStack(alignment: .leading, spacing: 0) {
                
                TextField("Name", text: $viewModel.name)
                    .textFieldStyle(GradientTextFieldBackground(systemImageString: "person"))
                
                if checkName {
                    Text("Text with warning")
                        .warningText()
                }
                
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(GradientTextFieldBackground(systemImageString: "envelope"))
                
                TextField("Password", text: $viewModel.password)
                    .textFieldStyle(GradientTextFieldBackground(systemImageString: "lock"))
                
                TextField("PasswordRep", text: $viewModel.passwordRep)
                    .textFieldStyle(GradientTextFieldBackground(systemImageString: "lock"))
                
            }
            .padding()
            
            
            Button("Register"){
                print("button pressed")
            }
            .buttonStyle(ButtonRegister())
            
            Spacer()
        }
        .background(Color.BMBackground)
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(viewModel: ViewModel())
    }
}
