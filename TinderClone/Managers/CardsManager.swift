//
//  CardsManager.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 30.10.25.
//

import Foundation
internal import Combine

@MainActor
final class CardsManager: ObservableObject {
    
    @Published var cards = [TinderUser]()
    
    init() {
        Task { await fetchCards() }
    }
    
    func fetchCards() async {
        Task {
            cards = MockData.users
        }
    }
    
    func remove(_ card: TinderUser) {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else { return }
        cards.remove(at: index)
    }
}
