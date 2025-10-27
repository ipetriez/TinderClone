//
//  ImageScrollOverlay.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 27.10.25.
//

import SwiftUI

struct ImageScrollOverlay: View {
    let photosCount: Int
    @Binding var currentImageIndex: Int
    
    var body: some View {
        HStack {
            Rectangle()
                .onTapGesture { goToPreviousImage() }
            
            Rectangle()
                .onTapGesture { goToNextImage() }
        }
        .foregroundStyle(.white.opacity(0.01))
    }
    
    private func goToNextImage() {
        if currentImageIndex < photosCount - 1 {
            currentImageIndex += 1
        } else {
            currentImageIndex = 0
        }
    }
    
    private func goToPreviousImage() {
        if currentImageIndex > 0 {
            currentImageIndex -= 1
        } else {
            currentImageIndex = photosCount - 1
        }
    }
}

#Preview {
    ImageScrollOverlay(photosCount: 2, currentImageIndex: .constant(1))
}
