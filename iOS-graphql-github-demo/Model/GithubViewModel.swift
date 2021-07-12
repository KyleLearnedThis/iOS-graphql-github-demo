//
//  GithubViewModel.swift
//  iOS-graphql-github-demo
//
//  Created by KyleLearnedThis on 7/12/21.
//  Main view model that creates and updates collections of models for view to display

import Foundation

class GitHubViewModel: ObservableObject {
    @Published var entries = [RepositoryEntry]()

    func fetchRepoList(_ number: Int) {
        Network.shared.apollo.fetch(query: RepoListQuery(first: number)) { result in
            switch result {
            case .success(let graphQLResult):
                let edges = graphQLResult.data?.search.edges as! [RepoListQuery.Data.Search.Edge]

                self.entries = edges.map { it in
                    let repo = it.node?.asRepository
                    let name = repo?.name ?? "Missing"
                    let owner = repo?.owner.login ?? "Github-Mark"
                    let avatarUrl = repo?.owner.avatarUrl ?? "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png"
                    let stargazerCount = repo?.stargazerCount ?? 0
                    let cursor = it.cursor
                    return RepositoryEntry(name: name, owner: owner, avatarUrl: avatarUrl, cursor: cursor, stargazerCount: stargazerCount)
                }

            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }

    func fetchMoreItems(cursor: String) {
        Network.shared.apollo.fetch(query: RepoPageListQuery(first: Configurations.pageSize, after: cursor)) { result in
            switch result {
            case .success(let graphQLResult):
                let edges = graphQLResult.data?.search.edges as! [RepoPageListQuery.Data.Search.Edge]

                let temp = edges.map { it -> RepositoryEntry in
                    let repo = it.node?.asRepository
                    let name = repo?.name ?? "Missing"
                    let owner = repo?.owner.login ?? "Github-Mark"
                    let avatarUrl = repo?.owner.avatarUrl ?? "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png"
                    let stargazerCount = repo?.stargazerCount ?? 0
                    let cursor = it.cursor
                    return RepositoryEntry(name: name, owner: owner, avatarUrl: avatarUrl, cursor: cursor, stargazerCount: stargazerCount)
                }

                self.entries += temp

            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
}
