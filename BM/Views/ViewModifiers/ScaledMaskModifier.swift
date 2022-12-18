//
//  ScaledMaskModifier.swift
//  BM
//
//  Created by NikitaSergeevich on 30/11/2022.
//

import SwiftUI

struct ScaledMaskModifier<Mask: View>: ViewModifier {
    var mask: Mask
    var progress: CGFloat
    func body(content: Content) -> some View {
        content
//            .mask(GeometryReader(content: { geometry in
//                self.mask.frame(width: self.calculateSize(geometry: geometry) * self.progress,
//                                height: self.calculateSize(geometry: geometry) * self.progress,
//                                alignment: .center)
//            }))
    }
    
    // calculate max size of mask
    
    func calculateSize(geometry: GeometryProxy) -> CGFloat {
        if geometry.size.width > geometry.size.height {
            return geometry.size.height
        }
        return geometry.size.height
    }
    
}
