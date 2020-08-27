//
//  Settings.swift
//  PomPom TImer
//
//  Created by Emad Rahman on 2020-05-24.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var timerState: TimerState
    @State private var showingAlert = false
    
    @State private var focusMinutes: String = "20"
    @State private var breakMinutes: String = "20"
    @State private var numberOfSessions: String = "4"
    
    private let defaults = UserDefaults.standard
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
//                    EditableFieldsView()
  
                    Section(header: Text("Focus Timer Settings")) {
                        HStack {
                            Text("Focus Minutes")
                            Spacer()
                            TextField("20", text: $focusMinutes)
                                .keyboardType(.decimalPad)
                                .frame(width: 40, height: 30)
                                .foregroundColor(.primary)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(5)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                            
                        }
                        
                        HStack {
                            Text("Break Minutes")
                            Spacer()
                            TextField("5", text: $breakMinutes)
                                .keyboardType(.decimalPad)
                                .frame(width: 40, height: 30)
                                .foregroundColor(.primary)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(5)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                        }
                        
                        HStack {
                            Text("Number Of Session")
                            Spacer()
                            TextField("4", text: $numberOfSessions)
                                .keyboardType(.decimalPad)
                                .frame(width: 40, height: 30)
                                .foregroundColor(.primary)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(5)
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                            
                        }
                    }
                    AboutView()
                }
            }
            .onTapGesture {
                KeyboardHelper().hideKeyboard()
            }
            .onAppear(perform: load)
            .navigationBarTitle("Settings", displayMode: .inline)
            .navigationBarItems(trailing:
                Button("Save") {
                    self.save()
                    KeyboardHelper().hideKeyboard()
                    self.showingAlert = true
                }
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Timer Values Saved!"),
                        message: Text("Focus minutes set to \(self.focusMinutes) mins. \n Break minutes set to \(self.breakMinutes) mins."),
                        dismissButton: .default(Text("Ok")))
                }
            )
        }
    }
    
    func save() {
        defaults.set(focusMinutes, forKey: "focusMinutes")
        defaults.set(breakMinutes, forKey: "breakMinutes")
    }
    
    func load() {
        let savedFocusMinutes = defaults.string(forKey: "focusMinutes")
        let savedBreakMinutes = defaults.string(forKey: "breakMinutes")
        
        focusMinutes = savedFocusMinutes == "0" ? "20" : savedFocusMinutes ?? "20"
        breakMinutes = savedBreakMinutes == "0" ? "5" : savedBreakMinutes ?? "5"
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(TimerState())
    }
}
