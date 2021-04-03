//
//  SettingsView.swift
//  Custodian
//
//  Created by Matt Porter on 4/1/21.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewManager: ViewManager

    var body: some View {
        VStack {
            Text("settings view")
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigation) {
                Button(action: { viewManager.navigate(to: .mainView) }) {
                    Label("Back", systemImage: "chevron.left")
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
