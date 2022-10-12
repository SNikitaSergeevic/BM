//
//  TextFieldForRegistration.swift
//  BM
//
//  Created by NikitaSergeevich on 10/07/2022.
//

import Foundation
import SwiftUI

struct GradientTextFieldBackground: TextFieldStyle {
    
    let systemImageString: String
    let text: String
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .stroke (LinearGradient.BMRegistrtionField)
                .frame(height: 40)
            HStack {
                Image(systemName: systemImageString)
                configuration
            }
            .padding(.leading)
            .foregroundColor(.gray)
        }
        .padding(.top, 15)
        .overlay(alignment: .leading) {
           
                Text(text)
                    .font(.system(size: 12, weight: .semibold, design: .serif))
                    .foregroundColor(Color("CNightPurple"))
                    .padding(1)
                    .background(Color.BMBackground)
                    .offset(x: 40, y: -13)
            
        }
    }
}



