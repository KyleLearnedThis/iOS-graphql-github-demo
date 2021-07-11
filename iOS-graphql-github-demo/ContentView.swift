//
//  ContentView.swift
//  iOS-graphql-github-demo
//
//  Created by KyleLearnedThis on 7/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear{
                fetchRepoList()
            }
    }

    func fetchRepoList() {
        Network.shared.apollo.fetch(query: RepoListQuery(first: 100)) { result in
            switch result {
            case .success(let graphQLResult):
                print("Success! Result: \(graphQLResult)")
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
