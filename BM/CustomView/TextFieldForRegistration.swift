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
    }
    
    
}



