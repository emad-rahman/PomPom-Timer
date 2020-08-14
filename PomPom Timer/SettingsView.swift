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
    
    var colors = ["Red", "Green", "Blue", "Tartan"]
    @State private var selectedColor = 0
    
    @State private var mins: Int = 45
    @State private var breakMins: Int = 45
    
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Focus Timer Settings")) {
                        HStack {
                            Text("Focus Minutes")
                            Spacer()
                            TextField("20", value: $mins, formatter: NumberFormatter())
                                .frame(width: 40, height: 30)
                                .foregroundColor(.primary)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(5)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                            Text("mins")
                        }
                        
                        HStack {
                            Text("Break Minutes")
                            Spacer()
                            TextField("5", value: $breakMins, formatter: NumberFormatter())
                                .frame(width: 40, height: 30)
                                .foregroundColor(.primary)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(5)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                            Text("mins")
                        }
                    }
                    
                    
                    Section(header: Text("About")) {
                        HStack {
                            Text("Version")
                            Spacer()
                            Text("1.0.0")
                        }
                    }
                }
            }
            .navigationBarTitle("Settings", displayMode: .large)
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
