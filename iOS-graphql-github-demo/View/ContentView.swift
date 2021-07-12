//
//  ContentView.swift
//  iOS-graphql-github-demo
//
//  Created by KyleLearnedThis on 7/11/21.
//

import SwiftUI

struct ContentView: View {
    var list = [RepoListQuery.Data.Search.Edge.Node.AsRepository]()
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
