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
        .init(id: UUID().uuidString, fullName: "Jean Shrimpton", age: 28, profileImageURLs: ["JeSh_1, JeSh_2, JeSh_3"]),
        .init(id: UUID().uuidString, fullName: "Imaan Hammam", age: 26, profileImageURLs: ["ImHa_1, ImHa_2, ImHa_3"]),
        .init(id: UUID().uuidString, fullName: "Taylor Hill", age: 27, profileImageURLs: ["TaHi_1, TaHi_2, TaHi_3"]),
        .init(id: UUID().uuidString, fullName: "Kendall Jenner", age: 30, profileImageURLs: ["KeJe_1, KeJe_2"])
    ]
}
