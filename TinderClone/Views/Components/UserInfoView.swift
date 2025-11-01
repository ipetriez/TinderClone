//
//  UserInfoView.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 27.10.25.
//

import SwiftUI

struct UserInfoView: View {
    @Binding var showProfile: Bool
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
                
                Button(action: showProfileTapped) {
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
    
    func showProfileTapped() {
        showProfile.toggle()
    }
}

#Preview {
    UserInfoView(showProfile: .constant(false), name: "D", age: 20)
}
