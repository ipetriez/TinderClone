//
//  CardStackView.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 30.10.25.
//

import SwiftUI

struct CardStackView: View {
    
    @StateObject var cardsManager = CardsManager()
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(cardsManager.cards) { card in
                    CardView(user: card, manager: cardsManager)
                }
            }
            
            if !cardsManager.cards.isEmpty {
                SwipeActionButtonsView(manager: cardsManager)
                    .padding(.top)
            }
        }
    }
}

#Preview {
    CardStackView()
}
