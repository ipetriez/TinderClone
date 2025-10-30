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
    @State private var currentImageIndex = 0
    @State private var photos: [String] = ["MF_1", "MF_2", "MF_3"]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(photos[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .overlay(
                        ImageScrollOverlay(
                            photosCount: photos.count,
                            currentImageIndex: $currentImageIndex
                        )
                    )
                
                CardImageIndicatorView(imageCount: photos.count, currentImageIndex: currentImageIndex)
                
                SwipeActionIndicatorView(xOffset: $xOffset)
                    .frame(width: Utilities.cardWidth)
            }
            
            UserInfoView()
                .frame(width: Utilities.cardWidth)
                .padding(.horizontal)
        }
        .frame(width: Utilities.cardWidth, height: Utilities.cardHeight)
        .clipShape(.rect(cornerRadius: 10))
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
        if abs(width) <= abs(Utilities.screenCutOff) {
            returnToCenter()
        } else if width >= Utilities.screenCutOff {
            swipeRight()
        } else if width < 0 {
            swipeLeft()
        }
    }
    
    private func swipeRight() {
        xOffset = 500
        degrees = 12
    }
    
    private func swipeLeft() {
        xOffset = -500
        degrees = -12
    }
    
    private func returnToCenter() {
        xOffset = 0
        degrees = 0
    }
}

#Preview {
    CardView()
}
