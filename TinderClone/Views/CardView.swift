//
//  CardView.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 27.10.25.
//

import SwiftUI

struct CardView: View {
    let user: ShminderUser
    @ObservedObject var manager: CardsManager
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    @State private var currentImageIndex = 0
    @State private var showProfile = false
    
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
            
            UserInfoView(
                showProfile: $showProfile,
                name: user.fullName,
                age: user.age
            )
                .frame(width: Utilities.cardWidth)
                .padding(.horizontal)
        }
        .fullScreenCover(isPresented: $showProfile) {
            UserProfileView(currentImageIndex: $currentImageIndex, user: user)
        }
        .onReceive(manager.$buttonSwipeAction) { onReceive($0) }
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
        withAnimation {
            xOffset = 500
            degrees = 12
        } completion: {
            manager.remove(user)
        }
    }
    
    private func swipeLeft() {
        withAnimation {
            xOffset = -500
            degrees = -12
        } completion: {
            manager.remove(user)
        }
    }
    
    private func returnToCenter() {
        withAnimation {
            xOffset = 0
            degrees = 0
        }
    }
    
    private func onReceive(_ action: SwipeAction?) {
        guard let action else { return }
        let topCard = manager.cards.last
        if topCard == user {
            switch action {
            case .like:
                swipeRight()
            case .reject:
                swipeLeft()
            }
        }
    }
}

#Preview {
    CardView(user: MockData.users[4], manager: CardsManager())
}
