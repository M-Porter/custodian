//
//  MainView.swift
//  Custodian
//
//  Created by Matt Porter on 4/1/21.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewManager: ViewManager
    @EnvironmentObject var dataStore: DataStore

    @State var presentingNewGroupView = false
    @State var presentingGroupsList = false

    @ViewBuilder func mainView() -> some View {
        let v = VStack {
            Text("main view")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)

        if dataStore.activeGroup == nil {
            v.navigationTitle("Custodian")
        } else {
            v.navigationTitle(dataStore.activeGroup!.name)
                .navigationSubtitle("\(dataStore.activeGroup!.repos.count) repositories")
        }
    }

    func getTitle() -> String {
        if dataStore.activeGroup == nil {
            return "Custodian"
        }
        return dataStore.activeGroup!.name
    }

    func getSubtitle() -> String {
        if dataStore.activeGroup == nil {
            return ""
        }
        return "\(dataStore.activeGroup!.repos.count) repositories"
    }

    var body: some View {
        VStack {
            Text("main view")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle(getTitle())
        .navigationSubtitle(getSubtitle())
        .sheet(isPresented: $presentingNewGroupView) {
            NewGroupView(isPresented: $presentingNewGroupView)
                .frame(minWidth: 300,
                       maxWidth: 300,
                       alignment: .trailing)
        }
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                Menu(content: {
                    ForEach(dataStore.groups, id: \.self) { group in
                        Button(group.name, action: {
                            dataStore.setActiveGroup(group)
                        })
                    }
                }, label: {
                    Image(systemName: "folder")
                    Text(dataStore.activeGroup?.name ?? "Groups")
                })

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
