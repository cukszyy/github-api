//
//  Home.swift
//  swiftui-github-api
//
//  Created by Lucas Portella on 13/09/20.
//

import SwiftUI

struct Home: View {
    
    @State var users: [User] = []
    @State var dataIsEmpty: Bool = false
    
    let network = Networker()

    var body: some View {
        VStack {
            if users.isEmpty {
                LoadingView(empty: dataIsEmpty, message: "No users found")
            } else {
                List(users) { user in
                    NavigationLink(destination: FollowerView(user: user)) {
                        UserRow(user: user)
                    }
                }
            }
        }
        .navigationBarItems(trailing: Button(
            action: {
                users.removeAll()
                network.getUserData(endpoint: "https://api.github.com/users") { users in
                    self.users = users
                    self.dataIsEmpty = users.isEmpty
                }
            }, label: {
                Image(systemName: "arrow.clockwise")
            }
        ))
        .onAppear {
            network.getUserData(endpoint: "https://api.github.com/users") { users in
                self.users = users
                self.dataIsEmpty = users.isEmpty
            }
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
