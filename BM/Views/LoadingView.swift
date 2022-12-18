//
//  LoadView.swift
//  BM
//
//  Created by NikitaSergeevich on 30/06/2022.
//

import SwiftUI

struct LoadingView<Content: View>: View {
    
    var content: Content
    @Binding var progress: CGFloat
    @State var logoOffset: CGFloat = 0 // animation Y offset
    
    var body: some View {
        content
            .modifier(ScaledMaskModifier(mask: RoundedRectangle(cornerRadius: 5), progress: progress))
            .offset(x: 0, y: logoOffset)
            .onAppear{
                withAnimation(Animation.easeInOut(duration: 1)) {
                    self.progress = 1.0
                }
                withAnimation(Animation.easeInOut(duration: 0.4).repeatForever(autoreverses: true)) {
                    self.logoOffset = 10
                }
            }
    }  
}

//struct LoadingView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoadingView()
//    }
//}
