//
//  LoadingView.swift
//  swiftui-github-api
//
//  Created by Lucas Portella on 13/09/20.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Spacer()
        ProgressView()
        Spacer()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
