//
//  MatchManager.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 04.11.25.
//

import Foundation
internal import Combine

@MainActor
final class MatchManager: ObservableObject {
    @Published var isMatchFound: Bool = false
    @Published var matchedUser: ShminderUser?
    
    func checkForMatch(with user: ShminderUser) {
        if Bool.random() {
            isMatchFound.toggle()
            matchedUser = user
        }
    }
}
