//
//  ButtonRegister.swift
//  BM
//
//  Created by NikitaSergeevich on 10/07/2022.
//

import Foundation
import SwiftUI

struct ButtonRegister: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 40)
            .padding(.vertical, 10)
            .background(LinearGradient.BMRegistrtionButton)
            .foregroundColor(Color(.white))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
