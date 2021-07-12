//
//  AsyncImageView.swift
//  iOS-graphql-github-demo
//
//  Created by KyleLearnedThis on 7/12/21.
//  Loads image remotely, peek cache for image in cache.  If it's not in the cache, create it and store it in cache for future use.

import SwiftUI

struct AsyncImageView<Placeholder: View>: View {
    @StateObject private var loader: AsyncImageLoader
    private let placeholder: Placeholder
    private let image: (UIImage) -> Image

    init(
        url: URL,
        @ViewBuilder placeholder: () -> Placeholder,
        @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)
    ) {
        self.placeholder = placeholder()
        self.image = image
        _loader = StateObject(wrappedValue: AsyncImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue))
    }

    init(
        urlString: String,
        @ViewBuilder placeholder: () -> Placeholder,
        @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)
    ) {
        let url = URL(string: urlString)!
        self.init(url: url, placeholder: placeholder, image: image)
    }


    var body: some View {
        content
            .onAppear(perform: loader.load)
    }

    private var content: some View {
        Group {
            if loader.image != nil {
                image(loader.image!)
            } else {
                placeholder
            }
        }
    }
}

