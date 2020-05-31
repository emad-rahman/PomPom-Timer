//
//  ContentView.swift
//  PomPom TImer
//
//  Created by Emad Rahman on 2020-05-24.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var timerState: TimerState
    
    var body: some View {
        TabView {
            TimerView(timerState: timerState)
                .tabItem {
                    Image(systemName: "clock")
                        .imageScale(.large)
                    Text("Timer")
            }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                        .imageScale(.large)
                    Text("Settings")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .light)
                .environmentObject(TimerState())
            
            ContentView()
                .environment(\.colorScheme, .dark)
                .environmentObject(TimerState())
            
        }
    }
}
