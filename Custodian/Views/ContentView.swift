//
//  ContentView.swift
//  Custodian
//
//  Created by Matt Porter on 3/31/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewManager: ViewManager

    @State var presentingNewGroupView = false

    @ViewBuilder func activatedView() -> some View {
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

    private func navigateTo(appView: AppView) {
        viewManager.navigate(to: appView)
    }

    var body: some View {
        activatedView()
            .sheet(isPresented: $presentingNewGroupView) {
                NewGroupView(isPresented: $presentingNewGroupView)
                    .frame(
                        minWidth: WINDOW_MIN_WIDTH-40,
                        maxWidth: WINDOW_MIN_WIDTH-40,
                        minHeight: WINDOW_MIN_HEIGHT-20,
                        maxHeight: WINDOW_MIN_HEIGHT-20
                    )
            }
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigation) {
                    if viewManager.activeView == AppView.settingsView {
                        Button(action: { navigateTo(appView: .mainView) }) {
                            Label("Back", systemImage: "chevron.left")
                        }
                    }
                }

                ToolbarItemGroup(placement: .primaryAction) {
                    if viewManager.activeView != AppView.settingsView {
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

                            Button(action: { navigateTo(appView: .settingsView) }) {
                                Label("Settings", systemImage: "gear")
                            }
                        }
                    }
                }
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
