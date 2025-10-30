//
//  CardView.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 27.10.25.
//

import SwiftUI

struct CardView: View {
    let user: TinderUser
    @ObservedObject var manager: CardsManager
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    @State private var currentImageIndex = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(user.profileImageURLs[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .overlay(
                        ImageScrollOverlay(
                            photosCount: user.profileImageURLs.count,
                            currentImageIndex: $currentImageIndex
                        )
                    )
                
                CardImageIndicatorView(imageCount: user.profileImageURLs.count, currentImageIndex: currentImageIndex)
                
                SwipeActionIndicatorView(xOffset: $xOffset)
                    .frame(width: Utilities.cardWidth)
            }
            
            UserInfoView(name: user.fullName, age: user.age)
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
        manager.remove(user)
    }
    
    private func swipeLeft() {
        xOffset = -500
        degrees = -12
        manager.remove(user)
    }
    
    private func returnToCenter() {
        xOffset = 0
        degrees = 0
    }
}

#Preview {
    CardView(user: MockData.users[4], manager: CardsManager())
}
