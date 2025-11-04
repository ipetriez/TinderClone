//
//  MainTabView.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 27.10.25.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var matchManager = MatchManager()
    @StateObject var cardsManager = CardsManager()
    
    var body: some View {
        TabView {
            CardStackView()
                .environmentObject(matchManager)
                .environmentObject(cardsManager)
                .tabItem { Image(systemName: "flame") }
                .tag(0)
            Text("Search View")
                .tabItem { Image(systemName: "magnifyingglass") }
                .tag(1)
            Text("Inbox View")
                .tabItem { Image(systemName: "bubble") }
                .tag(2)
            CurrentUserProfileView(user: MockData.users[0])
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .tabItem { Image(systemName: "person") }
                .tag(3)
        }
        .tint(.primary)
    }
}

#Preview {
    MainTabView()
}
