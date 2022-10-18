//
//  SmallAdsView.swift
//  BM
//
//  Created by NikitaSergeevich on 20/08/2022.
//

import SwiftUI

struct SmallAdsView: View {
    
    var ad: Ad
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
                HStack(alignment: .bottom, spacing: 0) {
                    VStack(alignment: .leading) {
                        Text(ad.title)
                            .lineLimit(3)
                            .font(.caption2)
                        Text(ad.price)
                            .font(.body)
                        Text(ad.address)
                            .font(.caption)
                        Text("24 september")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                    
                    VStack(spacing: 0) {
                        ZStack {
                            Capsule()
                                .frame(width: 20, height: 60)
                                .background(isPressed ? Color("LightPink") : Color.gray)
                                .opacity(0.05)
                            VStack {
                                LikeHeart(isPressed: $isPressed)
                                    .padding(0)
                                Text("9100")
                                    .font(.caption)
                                    .bold()
                                    .foregroundColor(isPressed ? Color("LightPink") : .gray)
                                    .padding(0)
                            }
                            .frame(maxWidth: 40)
                        }
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
}

struct LikeHeart: View {
    @Binding var isPressed: Bool
    @State var scale : CGFloat = 1
    @State var opacity  = 0.0
    
    var body: some View {
        
        ZStack {
            
            withAnimation(.linear) {
                Image(systemName: "heart.fill")
                    .opacity(isPressed ? 1 : 0)
                    .scaleEffect(isPressed ? 1.0 : 0.1)
                    .animation(.linear, value: isPressed)
            }
            Image(systemName: "heart")
                .font(.title2)
                .foregroundColor(isPressed ? Color("LightPink") : .gray)
            
        }
        .font(.system(size: 40))
        .onTapGesture {
            self.isPressed.toggle()
            withAnimation (.linear(duration: 0.05)) {
                self.scale = self.scale == 1 ? 1.3 : 1
                self.opacity = self.opacity == 0 ? 1 : 0
            }
            withAnimation {
                self.opacity = self.opacity == 0 ? 1 : 0
            }
        }
        .foregroundColor(isPressed ? Color("LightPink") : .white)
    }
}



//struct SmallAdsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SmallAdsView()
//
//    }
//}
