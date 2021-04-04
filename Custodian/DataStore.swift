//
//  Store.swift
//  Custodian
//
//  Created by Matt Porter on 4/2/21.
//

import SwiftUI

class DataStore: ObservableObject {
    @Published var groups: [Group] = []
    @Published var loading: Loading = Loading()
    @Published var activeGroup: Group? = nil

    func setup() {
        loading.initializing = true

        groups.append(
            Group(
                name: "Group 👺",
                repos: [
                    "/Users/mporter/dev/mporter/test-a"
                ]
            )
        )

        groups.append(
            Group(
                name: "Group 🥸",
                repos: [
                    "/Users/mporter/dev/mporter/test-b",
                    "/Users/mporter/dev/mporter/test-c"
                ]
            )
        )

        groups.append(
            Group(
                name: "Group 🤪",
                repos: [
                    "/Users/mporter/dev/mporter/test-d",
                    "/Users/mporter/dev/mporter/test-e",
                    "/Users/mporter/dev/mporter/test-f"
                ]
            )
        )

        activeGroup = groups[0]

        // load up the groups data
        loading.initializing = false
    }

    func setActiveGroup(_ group: Group) {
        activeGroup = group
    }
}

struct Group: Hashable {
    var id = UUID()
    var name: String
    var repos: [String]
}

struct Loading {
    var initializing = false
}
