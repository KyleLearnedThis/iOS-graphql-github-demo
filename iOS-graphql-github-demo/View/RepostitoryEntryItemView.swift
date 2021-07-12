//
//  RepostitoryEntryItemView.swift
//  iOS-graphql-github-demo
//
//  Created by KyleLearnedThis on 7/12/21.
//

import SwiftUI

struct RepostitoryEntryItemView: View {
    var entry: RepositoryEntry

    init(entry: RepositoryEntry) {
        self.entry = entry
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                RemoteImageView(urlString: entry.avatarUrl, isFit: true)
                    .frame(width: 40, height: 40)
                    .clipShape(Capsule())
                Text("\(entry.owner)")
                    .foregroundColor(.gray)
                    .padding()
            }
            HStack {
                Text("\(entry.name)")
                    .font(.title2)
                    .padding()
                Spacer()
                Image(systemName: "star")
                    .foregroundColor(.gray)
                Text("\(entry.stargazerCount) Stars")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
    }
}
