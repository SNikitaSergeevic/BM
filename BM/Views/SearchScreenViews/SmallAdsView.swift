//
//  SmallAdsView.swift
//  BM
//
//  Created by NikitaSergeevich on 20/08/2022.
//

import SwiftUI

struct SmallAdsView: View {
    
    @State var defaultData = DefaultDatas()
    @State var isPressed = false
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(color: .gray, radius: 4, x: 1, y: 1)
            
            VStack {
                HStack(spacing: 0) {
                    
                    GeometryReader { metrics in
                        Image("testP")
                            .resizable()
                            .scaledToFill()
                            .frame(width: metrics.size.width, height: metrics.size.height)
                            .cornerRadius(10)
                        
                    }
                    
                }
                
                HStack(spacing: 0) {
                    VStack(alignment: .leading) {
                        
                        Text(defaultData.defaultAd1.title)
                            .lineLimit(3)
                            .font(.caption2)
                        Text(defaultData.defaultAd1.price)
                            .font(.body)
                        Text(defaultData.defaultAd1.address)
                            .font(.caption)
                        Text("24 september")
                            .font(.caption2)
                            .foregroundColor(.gray)
                        
                    }
                    VStack {
                        LikeHeart(isPressed: $isPressed)
                    }
                    
                }
                .padding([.bottom, .horizontal],2)
            }
        }
        .frame(minWidth: 115, idealWidth: 140, maxWidth: 200, minHeight: 110, idealHeight: 245, maxHeight: 280)
        .background(Color.white)
        .padding(.vertical, 5)
        .padding(.horizontal, 5)
        
        
    }
    
//    var heartView: some View {
//        HStack {
//            if tappedHeart {
//                Image(systemName: "heart.fill")
//                    .font(.title)
//                    .foregroundColor(.red)
//                    .animation(.linear, value: 1)
//
//            } else {
//                Image(systemName: "heart")
//                    .font(.title)
//            }
//        }
//        .onTapGesture {
//            tappedHeart.toggle()
//
//        }
//
//    }
    
}

struct LikeHeart: View {
    @Binding var isPressed: Bool
    @State var scale : CGFloat = 1
    @State var opacity  = 0.0
    
           var body: some View {
               ZStack {
                
                       Image(systemName: "heart.fill")
                           .opacity(isPressed ? 1 : 0)
                           .scaleEffect(isPressed ? 1.0 : 0.1)
                           .animation(.linear)
                   
                   
                     
                   Image(systemName: "heart")
                       .font(.title2)
                       .foregroundColor(isPressed ? .red : .gray)
               }.font(.system(size: 40))
                   .onTapGesture {
                       self.isPressed.toggle()
                       withAnimation (.linear(duration: 0.1)) {
                                     self.scale = self.scale == 1 ? 1.3 : 1
                                     self.opacity = self.opacity == 0 ? 1 : 0
                                 }
                                 withAnimation {
                                     self.opacity = self.opacity == 0 ? 1 : 0
                                 }
               }
               .foregroundColor(isPressed ? .red : .white)
            }
}



//struct SmallAdsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SmallAdsView()
//
//    }
//}
