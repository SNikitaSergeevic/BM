//
//  LineGradientExtensions.swift
//  BM
//
//  Created by NikitaSergeevich on 10/07/2022.
//

import Foundation
import SwiftUI

extension LinearGradient {
    public static var BMRegistrtionField: LinearGradient {
        LinearGradient(colors: [Color("CPink"), Color("CBlue")], startPoint: .leading, endPoint: .trailing)
    }
    public static var BMRegistrtionButton: LinearGradient {
        LinearGradient(colors: [Color("CPink"), Color("CBlue")], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}


