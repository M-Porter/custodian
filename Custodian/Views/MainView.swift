//
//  MainView.swift
//  Custodian
//
//  Created by Matt Porter on 4/1/21.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewManager: ViewManager

    @State var presentingNewGroupView = false

    var body: some View {
        ZStack {
            VStack {
                Text("main view")
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                Group {
                    Menu {
                        Button(action: {}) {
                            Text("Weebly")
                        }
                        Button(action: {}) {
                            Text("Square")
                        }
                    } label: {
                        Text("Weebly")
                        Image(systemName: "folder")
                    }

                    Button(action: { presentingNewGroupView.toggle() }) {
                        Label("New Group", systemImage: "folder.badge.plus")
                    }

                    Button(action: { viewManager.navigate(to: .settingsView) }) {
                        Label("Settings", systemImage: "gear")
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
