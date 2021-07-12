# iOS-graphql-github-demo
iOS Demo for Github GraphQL demo

This iOS app is a demo assignment to fetch list of repository items from Github using Apollo iOS GraphQL library.

### Enviornment:
* Xcode Version 12.5.1 (12E507)
* Tested on iPhone 12 Pro Max (iOS 14.5) Simulator

### Setting
GitToken is in Configurations.swift (I don't know where is GraphQLClientProtocol.swift in the assignment)
Default Page size is 10 per page as defined on Configurations.swift.

### Used Libary
* [Apollo GraphQL iOS](https://github.com/apollographql/apollo-ios)
* Apple Native library: SwiftUI and Combine

### Overview
* Uses MVVM pattern
* Main view is MainView.swift
* Main view model is GitHubViewModel
* Two GraphQL queries RepoList.graphql and RepoPageList.graphql (used for pagination since it depends on cursor)


