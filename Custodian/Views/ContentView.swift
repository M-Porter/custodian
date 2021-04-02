//
//  ContentView.swift
//  Custodian
//
//  Created by Matt Porter on 3/31/21.
//

import SwiftUI

enum AppViews {
    case mainView
    case settingsView
}

struct ContentView: View {
    @State private var activeView: AppViews = .mainView
    @State private var showingNewGroupView: Bool = false

    @ViewBuilder private func activatedView() -> some View {
        switch activeView {
        case .mainView:
            MainView()
                .navigationTitle("Weebly")
                .navigationSubtitle("6 linked repositories")
        case .settingsView:
            SettingsView()
                .navigationTitle("Settings")
        }
    }

    private func navigateTo(appView: AppViews) {
        activeView = appView
    }

    private func navigateHome() {
        activeView = .mainView
    }

    private func setNewGroupView(showing: Bool) {
        showingNewGroupView = showing
    }

    var body: some View {
        activatedView()
            .sheet(isPresented: $showingNewGroupView) {
                SettingsView()
                    .padding()
                    .frame(
                        minWidth: WINDOW_MIN_WIDTH-40,
                        maxWidth: WINDOW_MIN_WIDTH-40,
                        minHeight: WINDOW_MIN_HEIGHT-20,
                        maxHeight: WINDOW_MIN_HEIGHT-20
                    )
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigation) {
                    if activeView == AppViews.settingsView {
                        Button(action: { navigateHome() }) {
                            Label("Back", systemImage: "chevron.left")
                        }
                    }
                }

                ToolbarItemGroup(placement: .primaryAction) {
                    if activeView != AppViews.settingsView {
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

                            Button(action: { setNewGroupView(showing: true) }) {
                                Label("New Group", systemImage: "folder.badge.plus")
                            }

                            Button(action: { navigateTo(appView: .settingsView) }) {
                                Label("Settings", systemImage: "gear")
                            }
                        }
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
