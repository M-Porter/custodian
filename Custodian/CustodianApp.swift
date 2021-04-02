//
//  CustodianApp.swift
//  Custodian
//
//  Created by Matt Porter on 3/31/21.
//

import SwiftUI

var idealHeight = CGFloat.init(600)
var idealWidth = CGFloat.init(368)

@main
struct CustodianApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(
                    minWidth: 100,
                    idealWidth: idealWidth,
                    maxWidth: .infinity,
                    minHeight: 100,
                    idealHeight: idealHeight,
                    maxHeight: .infinity,
                    alignment: .center
                )
        }
//        .windowStyle(DefaultWindowStyle())
//        .windowToolbarStyle(DefaultWindowToolbarStyle())
    }
}
