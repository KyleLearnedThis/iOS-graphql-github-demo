//
//  iOS_graphql_github_demoApp.swift
//  iOS-graphql-github-demo
//
//  Created by KyleLearnedThis on 7/11/21.
//

import SwiftUI

@main
struct iOS_graphql_github_demoApp: App {
    var body: some Scene {
        WindowGroup {
            let store = GitHubViewModel()
            MainView().environmentObject(store)
                .onAppear{
                    store.fetchRepoList(Configurations.pageSize)
                }
        }
    }
}
