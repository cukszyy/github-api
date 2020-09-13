//
//  FollowerView.swift
//  swiftui-github-api
//
//  Created by Lucas Portella on 13/09/20.
//

import SwiftUI

struct FollowerView: View {
    
    @State var followers: [User] = []
    @State var dataIsEmpty: Bool = false
    
    var user: User
    let network = Networker()
    
    var body: some View {
        VStack {
            if followers.isEmpty {
                LoadingView(empty: dataIsEmpty, message: "No followers found")
            } else {
                List {
                    Text("Followers")
                    ForEach(followers) { follower in
                        UserRow(user: follower)
                    }
                }
            }
        }
        .navigationTitle(Text(user.login))
        .onAppear {
            network.getUserData(endpoint: user.followers_url) { followers in
                self.followers = followers
                self.dataIsEmpty = followers.isEmpty
            }
        }
    }
}

//struct FollowerView_Previews: PreviewProvider {
//    static var previews: some View {
//        FollowerView()
//    }
//}
