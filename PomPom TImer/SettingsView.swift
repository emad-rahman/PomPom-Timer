//
//  Settings.swift
//  PomPom TImer
//
//  Created by Emad Rahman on 2020-05-24.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @State var temp = false
    @State var temp2 = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "moon.fill")
                    Toggle(isOn: $temp) {
                        Text("Setting 1")
                    }
                }
                
                Divider()
                
                HStack {
                    Image(systemName: "sparkles")
                    Toggle(isOn: $temp2) {
                        Text("Setting 2")
                    }
                }
                
                Divider()
                
                Spacer()
            }
            .padding(.all)
            .navigationBarTitle("Settings", displayMode: .inline)
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
