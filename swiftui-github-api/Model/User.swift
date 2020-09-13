//
//  User.swift
//  swiftui-github-api
//
//  Created by Lucas Portella on 13/09/20.
//

import Foundation

struct User: Identifiable, Decodable {
    var id: Int
    var login: String
    var avatar_url: String
    var followers_url: String
}
