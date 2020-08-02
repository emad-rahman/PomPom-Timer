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
                self.timerState.update()
            }.onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                self.timerState.setStateForBackground()
                
                if self.timerState.started {
                    NotificationHelper().sendNotificationRequestToNotificationCenter(timeIntervalInSeconds: self.timerState.remainingTimeInSeconds())
                }
            }.onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                self.timerState.setStateForForeground()
                NotificationHelper().removeAllApplicationNotificationsFromNotificationCenter()
            }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                        .imageScale(.large)
                    Text("Settings")
            }
        }
        .accentColor(Color("TimerCircleForeground"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .light)
                .environmentObject(TimerState())
            
//            ContentView()
//                .environment(\.colorScheme, .dark)
//                .environmentObject(TimerState())
        }
    }
}
