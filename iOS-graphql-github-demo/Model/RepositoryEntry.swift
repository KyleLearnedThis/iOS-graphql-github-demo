//
//  RepositoryEntry.swift
//  iOS-graphql-github-demo
//
//  Created by KyleLearnedThis on 7/12/21.
//

import Foundation

class RepositoryEntry: Hashable {
    static func == (lhs: RepositoryEntry, rhs: RepositoryEntry) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    var id = UUID()
    var name: String
    var owner: String
    var avatarUrl: String
    var cursor: String
    var stargazerCount: Int

    init(name: String, owner: String, avatarUrl: String, cursor: String, stargazerCount: Int) {
        self.name = name
        self.owner = owner
        self.avatarUrl = avatarUrl
        self.cursor = cursor
        self.stargazerCount = stargazerCount
    }
}
