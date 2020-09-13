//
//  Networker.swift
//  swiftui-github-api
//
//  Created by Lucas Portella on 13/09/20.
//

import Foundation

struct Networker {
    
    func getUserData(endpoint: String, completion: @escaping (([User]) -> ())) {
        let session = URLSession(configuration: .default)
        
        if let url = URL(string: endpoint) {
            session.dataTask(with: url) { (data, _, err) in
                if err != nil {
                    print("A problem occurred: \(String(describing: err?.localizedDescription))")
                }
                
                do {
                    let users = try JSONDecoder().decode([User].self, from: data!)
                    completion(users)
                } catch {
                     print("Error decoding \(error)")
                }
                
            }.resume()
        }
        
        
    }
    
}
