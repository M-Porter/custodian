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
    @State private var activeView: AppViews = .mainView;

    @ViewBuilder
    private func activatedView() -> some View {
        switch activeView {
        case .mainView:
            MainView()
        case .settingsView:
            SettingsView()
        }
    }

    private func navigateTo(appView: AppViews) {
        activeView = appView
    }

    private func navigateHome() {
        activeView = .mainView
    }

    var body: some View {
        activatedView()
            .transition(AnyTransition.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    if activeView == AppViews.settingsView {
                        Button(action: { navigateHome() }) {
                            Label("Back", systemImage: "chevron.left")
                        }
                    }
                }

                ToolbarItem(placement: .primaryAction) {
                    if activeView != AppViews.settingsView {
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
                        .transition(AnyTransition.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
                    }
                }

                ToolbarItem(placement: .primaryAction) {
                    Button(action: { navigateTo(appView: .settingsView) }) {
                        Label("Settings", systemImage: "gear")
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
