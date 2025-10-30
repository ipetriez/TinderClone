//
//  UserInfoView.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 27.10.25.
//

import SwiftUI

struct UserInfoView: View {
    let name: String
    let age: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(name)
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text("\(age)")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: showProfile) {
                    Image(systemName: "arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                }
            }
            
            Text("Actress | Witch")
                .font(.subheadline)
                .lineLimit(2)
        }
        .foregroundStyle(.white)
        .padding()
        .background {
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
        }
    }
    
    func showProfile() {
        print("Debug: Show profile tapped")
    }
}

#Preview {
    UserInfoView(name: "D", age: 20)
}
