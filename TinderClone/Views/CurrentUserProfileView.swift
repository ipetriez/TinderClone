//
//  CurrentUserProfileView.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 02.11.25.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: ShminderUser
    
    var body: some View {
        List {
            CurrentUserProfileHeaderView(user: user)
            
            Section("Account Information") {
                HStack {
                    Text("Name")
                    Spacer()
                    Text("\(user.fullName)")
                }
                
                HStack {
                    Text("Email")
                    Spacer()
                    Text("test@email.com")
                }
            }
            
            Section("Legal") {
                HStack {
                    Text("Terms of Service")
                    Spacer()
                    Text("\(user.fullName)")
                }
            }
            
            Section {
                Button {
                    print("Debug: Logout tapped")
                } label: {
                    Text("Logout")
                        .foregroundStyle(.red)
                }
            }
            
            Section {
                Button {
                    print("Debug: Delete tapped")
                } label: {
                    Text("Delete Account")
                        .foregroundStyle(.red)
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users[0])
}
