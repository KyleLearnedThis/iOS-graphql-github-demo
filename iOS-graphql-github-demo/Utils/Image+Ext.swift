//
//  Image+Ext.swift
//  iOS-graphql-github-demo
//
//  Created by KyleLearnedThis on 7/12/21.
//

import Foundation
import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
