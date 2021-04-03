//
//  CustodianApp.swift
//  Custodian
//
//  Created by Matt Porter on 3/31/21.
//

import SwiftUI

@main
struct CustodianApp: App {
    @StateObject var viewManager = ViewManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(
                    minWidth: WINDOW_MIN_WIDTH,
                    idealWidth: WINDOW_MIN_WIDTH,
                    maxWidth: .infinity,
                    minHeight: WINDOW_MIN_HEIGHT,
                    idealHeight: WINDOW_MIN_HEIGHT,
                    maxHeight: .infinity,
                    alignment: .center
                )
                .environmentObject(viewManager)
        }
//        .windowStyle(DefaultWindowStyle())
//        .windowToolbarStyle(DefaultWindowToolbarStyle())
    }
}
