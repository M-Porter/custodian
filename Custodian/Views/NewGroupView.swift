//
//  NewGroupView.swift
//  Custodian
//
//  Created by Matt Porter on 4/1/21.
//

import SwiftUI

struct NewGroupView: View {
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            Text("new group view view")
                .padding()
            Spacer()
            HStack {
                Button("Cancel", action: { isPresented.toggle() })
                Spacer()
                Button("Create", action: { })
            }
            .padding()
        }
    }
}

struct NewGroupView_Previews: PreviewProvider {
    static var previews: some View {
        NewGroupView(isPresented: .constant(true))
    }
}
