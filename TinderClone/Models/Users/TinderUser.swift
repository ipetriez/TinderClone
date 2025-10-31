//
//  User.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 30.10.25.
//

import Foundation

struct TinderUser: Identifiable, Equatable {
    let id: String
    let fullName: String
    var age: Int
    var profileImageURLs: [String]
}
