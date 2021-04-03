//
//  ActiveViewManager.swift
//  Custodian
//
//  Created by Matt Porter on 4/2/21.
//

import SwiftUI

enum AppView {
    case mainView
    case settingsView
}

class ViewManager: ObservableObject {
    @Published var activeView = AppView.mainView

    func navigate(to: AppView) {
        activeView = to
    }
}
