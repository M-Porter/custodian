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

    init(groups: [Group]) {
        self.groups = groups
    }

    func initializeData() {
        loading.initializing = true
        // load up the groups data
        loading.initializing = false
    }
}

struct Group {
    var name: String
    var repos: [String]
}

struct Loading {
    var initializing = false
}
