//
//  AboutView.swift
//  PomPom Timer
//
//  Created by Emad Rahman on 2020-08-15.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        Section(header: Text("About")) {
            HStack {
                Text("Version")
                Spacer()
                Text("1.0.0")
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
