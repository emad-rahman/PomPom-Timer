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
    
    @State private var focusMinutes: String = ""
    @State private var breakMinutes: String = ""
    @State private var numberOfSessions: String = ""
    
    private let defaults = UserDefaults.standard
    private let dataContext = DataContext()
    
    var frameworks = ["UIKit", "Core Data", "CloudKit", "SwiftUI"]
    @State private var selectedFrameworkIndex = 0
    @State var selectedDate = Date()
    
    
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let max = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        return min...max
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Focus Timer Settings")) {
                        HStack {
                            Text("Focus minutes")
                            Spacer()
                            TextField(String(TimerConstants.defaultFocusMinutes), text: $focusMinutes)
                                .keyboardType(.numberPad)
                                .frame(width: 40, height: 32)
                                .foregroundColor(.primary)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(5)
                                .multilineTextAlignment(.center)
                        }
                        
                        HStack {
                            Text("Break minutes")
                            Spacer()
                            TextField(String(TimerConstants.defaultShortBreakMinutes), text: $breakMinutes)
                                .keyboardType(.numberPad)
                                .frame(width: 40, height: 32)
                                .foregroundColor(.primary)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(5)
                                .multilineTextAlignment(.center)
                        }
                        
                        HStack {
                            Text("Number of sessions before break")
                            Spacer()
                            TextField(String(TimerConstants.defaultNumberOfSessions), text: $numberOfSessions)
                                .keyboardType(.numberPad)
                                .frame(width: 40, height: 32)
                                .foregroundColor(.primary)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(5)
                                .multilineTextAlignment(.center)
                        }
                    }
                    
                    AboutView()
                    
                }
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
