//
//  CardStackView.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 30.10.25.
//

import SwiftUI

struct CardStackView: View {
    
    @EnvironmentObject var cardsManager: CardsManager
    @EnvironmentObject var matchManager: MatchManager
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 16) {
                    ZStack {
                        ForEach(cardsManager.cards) { card in
                            CardView(user: card, manager: cardsManager)
                                .environmentObject(matchManager)
                        }
                    }
                    
                    if !cardsManager.cards.isEmpty {
                        SwipeActionButtonsView(manager: cardsManager)
                    }
                }
                .blur(radius: matchManager.isMatchFound ? 20 : 0)
                
                if matchManager.isMatchFound {
                    MatchView(show: $matchManager.isMatchFound)
                        .environmentObject(matchManager)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack(spacing: 0) {
                        Image(systemName: "flame.fill")
                            .foregroundStyle(.red)
                        Text("Shminder")
                            .frame(width: 100)
                            .foregroundStyle(.cyan)
                            .fontWeight(.heavy)
                            .font(.callout)
                    }
                }
            }
        }
    }
}

#Preview {
    CardStackView()
        .environmentObject(MatchManager())
        .environmentObject(CardsManager())
}
