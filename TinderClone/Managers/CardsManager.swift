//
//  CardsManager.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 30.10.25.
//

import Foundation
internal import Combine

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
}
