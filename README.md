# iOS-graphql-github-demo
iOS Demo for Github GraphQL demo

This iOS app is a demo assignment to fetch list of repository items from Github using Apollo iOS GraphQL library.  Notices that you must enter your own personal access token (since this is a public repository) If not, this app won't work, you will get 401 on Github http POSTs errout on bearing token error. Please update Configurations.swift at variable gitToken at line 11 (I regenerated the my Personal access token so it's no longer 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). 

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


