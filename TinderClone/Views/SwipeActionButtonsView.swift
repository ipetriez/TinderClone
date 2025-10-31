//
//  SwipeActionButtonsView.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 31.10.25.
//

import SwiftUI

struct SwipeActionButtonsView: View {
    
    @ObservedObject var manager: CardsManager
    
    var body: some View {
        HStack(spacing: 32) {
            Button {
                manager.buttonSwipeAction = .reject
            } label: {
                Image(systemName: "xmark")
                    .fontWeight(.heavy)
                    .foregroundColor(.red)
                    .background {
                        Circle()
                            .fill(.white)
                            .frame(width: 48, height: 48)
                            .shadow(radius: 8)
                    }
            }
            .frame(width: 48, height: 48)
            
            Button {
                manager.buttonSwipeAction = .like
            } label: {
                Image(systemName: "heart.fill")
                    .fontWeight(.heavy)
                    .foregroundColor(.green)
                    .background {
                        Circle()
                            .fill(.white)
                            .frame(width: 48, height: 48)
                            .shadow(radius: 8)
                    }
            }
            .frame(width: 48, height: 48)
        }
    }
}

#Preview {
    SwipeActionButtonsView(manager: CardsManager())
}
