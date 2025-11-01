//
//  UserProfileView.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 01.11.25.
//

import SwiftUI

struct UserProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var currentImageIndex: Int
    let user: ShminderUser
    
    var body: some View {
        VStack {
            HStack {
                Text(user.fullName)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("\(user.age)")
                    .font(.title2)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.down.circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundStyle(.pink)
                }
            }
            .padding(.horizontal)
            
            ScrollView {
                VStack {
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
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("About me")
                            .fontWeight(.semibold)
                        Text("Some bio")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(.systemGroupedBackground))
                    .font(.subheadline)
                    .clipShape(.rect(cornerRadius: 10))
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Essentials")
                        HStack {
                            Image(systemName: "person")
                            Text("Woman")
                            Spacer()
                        }
                        
                        Text("Essentials")
                        HStack {
                            Image(systemName: "arrow.down.forward.and.arrow.up.backward.circle")
                            Text("Straight")
                            Spacer()
                        }
                        
                        Text("Essentials")
                        HStack {
                            Image(systemName: "book")
                            Text("Actress")
                            Spacer()
                        }
                    }
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color(.systemGroupedBackground))
                    .font(.subheadline)
                    .clipShape(.rect(cornerRadius: 10))
                }
            }
        }
    }
}

#Preview {
    UserProfileView(currentImageIndex: .constant(0), user: MockData.users[0])
}
