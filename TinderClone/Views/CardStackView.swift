//
//  CardStackView.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 30.10.25.
//

import SwiftUI

struct CardStackView: View {
    var body: some View {
        ZStack {
            ForEach(0 ..< 10) { card in
                CardView()
            }
        }
    }
}

#Preview {
    CardStackView()
}
