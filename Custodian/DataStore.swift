//
//  Store.swift
//  Custodian
//
//  Created by Matt Porter on 4/2/21.
//

import SwiftUI

class DataStore: ObservableObject {
    @Published var groups: [Group] = []

    init(groups: [Group]) {
        self.groups = groups
    }
}

struct Group {
    var name: String
    var repos: [String]
}
