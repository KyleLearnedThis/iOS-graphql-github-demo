//
//  GithubViewModel.swift
//  iOS-graphql-github-demo
//
//  Created by KyleLearnedThis on 7/12/21.
//

import Foundation

class GitHubViewModel: ObservableObject {
    @Published var entries = [RepositoryEntry]()

    func fetchRepoList(_ number: Int) {
        Network.shared.apollo.fetch(query: RepoListQuery(first: number)) { result in
            switch result {
            case .success(let graphQLResult):
                let edges = graphQLResult.data?.search.edges as! [RepoListQuery.Data.Search.Edge]

                self.entries = edges.map { it in
                    let name = it.node?.asRepository?.name ?? "Anon"
                    let avatarUrl = it.node?.asRepository?.owner.avatarUrl ?? "https://www.error.com"
                    let stargazerCount = it.node?.asRepository?.stargazerCount ?? -1
                    let cursor = it.cursor
                    return RepositoryEntry(name: name, avatarUrl: avatarUrl, cursor: cursor, stargazerCount: stargazerCount)
                }

            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
}
