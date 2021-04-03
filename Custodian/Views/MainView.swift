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
        .sheet(isPresented: $presentingNewGroupView) {
            NewGroupView(isPresented: $presentingNewGroupView)
                .frame(
                    minWidth: WINDOW_MIN_WIDTH-40,
                    maxWidth: WINDOW_MIN_WIDTH-40,
                    minHeight: WINDOW_MIN_HEIGHT-20,
                    maxHeight: WINDOW_MIN_HEIGHT-20
                )
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
