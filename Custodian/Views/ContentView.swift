//
//  ContentView.swift
//  Custodian
//
//  Created by Matt Porter on 3/31/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewManager: ViewManager

    var body: some View {
        switch viewManager.activeView {
        case .mainView:
            MainView()
        case .settingsView:
            SettingsView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
