//
//  MatchView.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 02.11.25.
//

import SwiftUI

struct MatchView: View {
    @Binding var show: Bool
    @EnvironmentObject var matchManager: MatchManager
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black.opacity(0.7))
                .ignoresSafeArea()
            
            VStack(spacing: 120) {
                VStack {
                    Text("It's a match")
                        .font(.largeTitle)
                    Text("You and \(matchManager.matchedUser?.fullName ?? "") have liked each other")
                }
                .foregroundStyle(.white)
                
                HStack(spacing: 16) {
                    Image(MockData.users[0].profileImageURLs[0])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(.white, lineWidth: 2)
                                .shadow(radius: 10)
                        }
                    
                    Image(matchManager.matchedUser?.profileImageURLs[0] ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(.white, lineWidth: 2)
                                .shadow(radius: 10)
                        }
                }
                
                VStack(spacing: 16) {
                    Button("Send Message") {
                        show.toggle()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350, height: 44)
                    .background(.pink)
                    .clipShape(.capsule)
                    
                    Button("Keep Swiping") {
                        show.toggle()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350, height: 44)
                    .background(.clear)
                    .overlay {
                        Capsule()
                            .stroke(.white, lineWidth: 1.5)
                            .shadow(radius: 4)
                    }
                }
            }
        }
    }
}

#Preview {
    MatchView(show: .constant(true))
        .environmentObject(MatchManager())
}
