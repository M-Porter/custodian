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

    @ViewBuilder func slideOutView() -> some View {
        if presentingNewGroupView {
            HStack {
                Spacer()
                NewGroupView(isPresented: $presentingNewGroupView)
                    .background(Color(.windowBackgroundColor))
                    .frame(
                        minWidth: 300,
                        maxWidth: 300,
                        alignment: .trailing
                    )
            }
        }
    }

    var body: some View {
        ZStack {
            VStack {
                Text("main view")
            }
            slideOutView()
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
                .animation(.default)
        }
        .navigationTitle("Project A")
        .navigationSubtitle("3 repositories")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                Group {
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
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
