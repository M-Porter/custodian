//
//  SettingsView.swift
//  Custodian
//
//  Created by Matt Porter on 4/1/21.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("settings view")
                .padding()
            Spacer()
            HStack {
                Button("Cancel", action: { presentationMode.wrappedValue.dismiss() })
                Spacer()
                Button("Create", action: { })
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
