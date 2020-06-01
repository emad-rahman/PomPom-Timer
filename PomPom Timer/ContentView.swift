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
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TabView {
            TimerView()
                .tabItem {
                    Image(systemName: "clock")
                        .imageScale(.large)
                    Text("Timer")
            }.onReceive(timer) { input in
                if self.timerState.secondsLeft > 0 && self.timerState.started {
                    self.timerState.secondsLeft -= 1
                } else if self.timerState.secondsLeft == 0 && self.timerState.started {
                    self.timerState.minutesLeft -= 1;
                    self.timerState.secondsLeft = 60;
                } else if self.timerState.isTimerFinished() {
                    
                }
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
