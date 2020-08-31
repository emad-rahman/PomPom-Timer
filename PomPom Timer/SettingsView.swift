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
    private let dataContext = DataContext()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
//                    EditableFieldsView()
  
                    Section(header: Text("Focus Timer Settings")) {
                        HStack {
                            Text("Focus minutes")
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
                            Text("Break minutes")
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
                            Text("Number of sessions before break")
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
        dataContext.SaveFocusMinutesToUserDefaults(focusMinutes: focusMinutes)
        dataContext.SaveShortBreakMinutesToUserDefaults(breakMinutes: breakMinutes)
        dataContext.SaveNumberOfSessionsToUserDefaults(numberOfSessions: numberOfSessions)
    }
    
    func load() {
        focusMinutes = String(dataContext.GetFocusMinutesFromUserDefaults())
        breakMinutes = String(dataContext.GetShortBreakMinutesFromUserDefaults())
        numberOfSessions = String(dataContext.GetNumberOfSessionsFromUserDefaults())
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(TimerState())
    }
}
