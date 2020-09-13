//
//  LoadingView.swift
//  swiftui-github-api
//
//  Created by Lucas Portella on 13/09/20.
//

import SwiftUI

struct LoadingView: View {
    
    var empty: Bool
    var message: String?
    
    var body: some View {
        Spacer()
        
        if empty {
            Text(message ?? "No users found")
        } else {
            ProgressView()
        }
        
        Spacer()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(empty: false, message: nil)
    }
}
