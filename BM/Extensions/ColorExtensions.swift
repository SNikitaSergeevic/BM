//
//  ColorExtensions.swift
//  BM
//
//  Created by NikitaSergeevich on 10/07/2022.
//

import Foundation
import SwiftUI

extension Color {
  init(hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: alpha
    )
  }
    
    public static var BMBackground: Color {
        Color(red: 249/255, green: 245/255, blue: 245/255, opacity: 1)
    }
    
    public static var BMFieldGradient: Color {
        Color(red: 198/255, green: 93/255, blue: 123/255, opacity: 1)

    }
    
    public static var BMFieldGradientTwo: Color {
        Color(red: 92/255, green: 179/255, blue: 218/255, opacity: 1)

    }
    
    public static var BMWarningText: Color {
        Color(red: 200/255, green: 10/255, blue: 20/255, opacity: 1)
    }
    
}



