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
        VStack {
            Text("main view")
        }
        .navigationTitle("Project A")
        .navigationSubtitle("3 repositories")
        .sheet(isPresented: $presentingNewGroupView) {
            NewGroupView(isPresented: $presentingNewGroupView)
                .frame(
                    minWidth: 300,
                    maxWidth: 300,
                    alignment: .trailing
                )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                Menu {
                    Button("Project A", action: {})
                    Button("Project B", action: {})
                    Button("Project C", action: {})
                    Button("Project D", action: {})
                } label: {
                    Text("Project A")
                    Image(systemName: "folder")
                }

                Button(action: { presentingNewGroupView = true }) {
                    Label("New Group", systemImage: "folder.badge.plus")
                }

                Button(action: { viewManager.navigate(to: .settingsView) }) {
                    Label("Settings", systemImage: "gear")
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
