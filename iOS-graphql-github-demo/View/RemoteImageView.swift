//
//  RemoteImageView.swift
//  iOS-graphql-github-demo
//
//  Created by KyleLearnedThis on 7/12/21.
//

import SwiftUI

struct RemoteImageView: View {
    private var urlString: String = ""
    private var isFit = true

    init(urlString: String = "", isFit: Bool = true) {
        self.urlString = urlString
    }

    var body: some View {
        AsyncImageView(
            urlString: self.urlString,
            placeholder: { ProgressView()},
            image: {
                Image(uiImage: $0).resizable()
            }
        )
        .aspectRatio(contentMode: (self.isFit == true) ? (.fit) : (.fill))
        .id(UUID())
    }
}
