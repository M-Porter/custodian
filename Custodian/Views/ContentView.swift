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
                .navigationTitle("Weebly")
                .navigationSubtitle("6 linked repositories")
        case .settingsView:
            SettingsView()
                .navigationTitle("Settings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
