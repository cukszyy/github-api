//
//  Home.swift
//  swiftui-github-api
//
//  Created by Lucas Portella on 13/09/20.
//

import SwiftUI

struct Home: View {
    
    @State var users: [User] = []
    let homeController = HomeController()

    var body: some View {
        VStack {
            if users.isEmpty {
                LoadingView()
            } else {
                List(users) { user in
                    UserRow(user: user)
                }
            }
        }.onAppear {
            homeController.getUserData(endpoint: "/users") { users in
                self.users = users
            }
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
