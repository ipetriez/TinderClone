//
//  CardImageIndicatorView.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 30.10.25.
//

import SwiftUI

struct CardImageIndicatorView: View {
    let imageCount: Int
    let currentImageIndex: Int
    
    var body: some View {
        HStack {
            ForEach(0..<imageCount, id: \.self) { index in
                Capsule()
                    .foregroundStyle(currentImageIndex == index ? Color.white : Color.gray)
                    .opacity(0.8)
                    .frame(width: (Utilities.cardWidth / CGFloat(imageCount)) - 28, height: 4)
                    .padding(.top, 8)
                    
            }
        }
    }
}

#Preview {
    CardImageIndicatorView(imageCount: 2, currentImageIndex: 1)
        .preferredColorScheme(.dark)
}
