//
//  TextExtensions.swift
//  BM
//
//  Created by NikitaSergeevich on 10/07/2022.
//

import Foundation
import SwiftUI

extension Text {
    func warningText() -> some View {
        self
            .modifier(WarningTextModifer())
    }
}
