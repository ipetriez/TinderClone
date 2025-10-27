//
//  CardView.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 27.10.25.
//

import SwiftUI

struct CardView: View {
    
    private var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    
    private var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(.sampleProfile)
                .resizable()
                .scaledToFill()
                .frame(width: cardWidth, height: cardHeight)
                .clipShape(.rect(cornerRadius: 10))
            
            UserInfoView()
                .frame(width: cardWidth)
                .padding(.horizontal)
        }
    }
}

#Preview {
    CardView()
}
