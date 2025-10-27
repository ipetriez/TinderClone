//
//  CardView.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 27.10.25.
//

import SwiftUI

struct CardView: View {
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    
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
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .animation(.snappy(), value: xOffset)
        .gesture(
            DragGesture()
                .onChanged({ value in
                    onDragChanged(value)
                })
                .onEnded({ value in
                    onDragEnded(value)
                }))
    }
    
    private func onDragChanged(_ value: DragGesture.Value) {
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    
    private func onDragEnded(_ value: DragGesture.Value) {
        let width = value.translation.width
        if abs(width) <= abs(screenCutOff) {
            xOffset = 0
            degrees = 0
        } else {
            
        }
    }
}

private extension CardView {
    var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    
    var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
    
    var screenCutOff: CGFloat {
        (UIScreen.main.bounds.width / 2) * 0.8
    }
}

#Preview {
    CardView()
}
