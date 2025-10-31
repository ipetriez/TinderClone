//
//  MockData.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 30.10.25.
//

import Foundation

struct MockData {
    static let users: [TinderUser] = [
        .init(id: UUID().uuidString, fullName: "Megan Fox", age: 25, profileImageURLs: ["MF_1", "MF_2", "MF_3"]),
        .init(id: UUID().uuidString, fullName: "Jean Shrimpton", age: 28, profileImageURLs: ["MF_12", "MF_13", "MF_11"]),
        .init(id: UUID().uuidString, fullName: "Imaan Hammam", age: 26, profileImageURLs: ["MF_23", "MF_21", "MF_22"]),
        .init(id: UUID().uuidString, fullName: "Taylor Hill", age: 27, profileImageURLs: ["MF_21", "MF_12", "MF_23"]),
        .init(id: UUID().uuidString, fullName: "Kendall Jenner", age: 30, profileImageURLs: ["MF_33", "MF_32", "MF_31"])
    ]
}
