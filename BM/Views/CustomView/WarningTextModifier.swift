//
//  WarningTextModifier.swift
//  BM
//
//  Created by NikitaSergeevich on 10/07/2022.
//

import Foundation
import SwiftUI

struct WarningTextModifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.BMWarningText)
    }
}
