//
//  Timer.swift
//  PomPom TImer
//
//  Created by Emad Rahman on 2020-05-24.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var timerState: TimerState
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                ZStack {
                    ClockView()
                    TimerTextView()
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        self.timerState.started.toggle()
                    }) {
                        if !self.timerState.started {
                            Image(systemName: "play.circle.fill")
                                .imageScale(.large)
                            Text("Start")
                        }
                        else{
                            Image(systemName: "pause.circle.fill")
                                .imageScale(.large)
                            Text("Stop")
                        }
                    }
                    
                    Spacer()
                
                    Button(action: {
                        self.timerState.reset()
                    }) {
                        Image(systemName: "arrow.uturn.left.circle.fill")
                            .imageScale(.large)
                        Text("Reset")
                    }
                    
                    Spacer()
                }
                Spacer()
            }
            .navigationBarTitle("PomPom Timer", displayMode: .inline)
        }
    }
}

struct Timer_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(TimerState())
    }
}
