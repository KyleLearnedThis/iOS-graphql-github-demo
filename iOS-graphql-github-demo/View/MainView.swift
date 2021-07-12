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
        Text("Repository List")
        repositoryListView
    }

    var repositoryListView: some View {
        List(store.entries, id: \.self) { entry in
            RepostitoryEntryItemView(entry: entry)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
