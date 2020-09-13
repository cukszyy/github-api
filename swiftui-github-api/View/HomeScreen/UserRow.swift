//
//  UserRow.swift
//  swiftui-github-api
//
//  Created by Lucas Portella on 13/09/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserRow: View {
    
    var user: User
    
    var body: some View {
        HStack {
            AnimatedImage(url: URL(string: user.avatar_url)!)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .shadow(radius: 5)
            Text(user.login)
                .fontWeight(.heavy)
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(user: User(
                    id: 2,
                    login: "defunkt",
                    avatar_url: "https://avatars0.githubusercontent.com/u/2?v=4",
                    followers_url: "https://api.github.com/users/defunkt/followers"))
    }
}
