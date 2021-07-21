//
//  MainView.swift
//  iOS-graphql-github-demo
//
//  Created by KyleLearnedThis on 7/12/21.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var store: GitHubViewModel

    var body: some View {
        Text("Repository List").bold()
        repositoryListView
    }

    var repositoryListView: some View {
        List(store.entries, id: \.self) { entry in
            RepostitoryEntryItemView(entry: entry)
                .onAppear(perform: {
                    let cur = entry
                    let last = self.store.entries.last!
                    if cur.id == last.id {
                        let cursor = cur.cursor
                        self.store.fetchMoreItems(cursor: cursor)
                    }
                })
        }
    }
}
