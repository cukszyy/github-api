//
//  HomeController.swift
//  swiftui-github-api
//
//  Created by Lucas Portella on 13/09/20.
//

import Foundation

struct HomeController {
    
    let baseURL: String = "https://api.github.com"
    
    func getUserData(endpoint: String, completion: @escaping (([User]) -> ())) {
        let session = URLSession(configuration: .default)
        
        if let url = URL(string: "\(baseURL)\(endpoint)") {
            session.dataTask(with: url) { (data, _, err) in
                if err != nil {
                    print("A problem occurred: \(String(describing: err?.localizedDescription))")
                }
                print(url)
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
