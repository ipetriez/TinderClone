//
//  ProfileImageGridView.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 02.11.25.
//

import SwiftUI

struct ProfileImageGridView: View {
    
    let user: ShminderUser
    
    private var columns: [GridItem] {
        [
            .init(.flexible(minimum: 100)),
            .init(.flexible(minimum: 100)),
            .init(.flexible(minimum: 100))
        ]
    }
    
    private var imageHeight: CGFloat { 160 }
    private var imageWidth: CGFloat { 110 }
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(0..<6) { index in
                if index < user.profileImageURLs.count {
                    Image(user.profileImageURLs[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageWidth, height: imageHeight)
                        .clipShape(.rect(cornerRadius: 10))
                        
                } else {
                    ZStack(alignment: .bottomTrailing) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.secondarySystemBackground))
                            .frame(width: imageWidth, height: imageHeight)
                            .clipShape(.rect(cornerRadius: 10))
                        
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                            .foregroundStyle(.pink)
                            .offset(x: 4, y: 4)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileImageGridView(user: MockData.users[0])
}
