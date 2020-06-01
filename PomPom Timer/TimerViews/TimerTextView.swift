//
//  TimerTextView.swift
//  PomPom Timer
//
//  Created by Emad Rahman on 2020-05-31.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import SwiftUI

struct TimerTextView: View {
    @EnvironmentObject var timerState: TimerState
    
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            HStack {
                Text("\(self.timerState.minutesLeft)")
                    .font(.largeTitle)
                Text(":")
                    .font(.largeTitle)
                Text("\(self.timerState.secondsLeft)")
                    .font(.largeTitle)
            }
//            .onReceive(timer) { input in
//                if self.timerState.secondsLeft > 0 && self.timerState.started {
//                    self.timerState.secondsLeft -= 1
//                } else if self.timerState.secondsLeft == 0 && self.timerState.started {
//                    self.timerState.minutesLeft -= 1;
//                    self.timerState.secondsLeft = 60;
//                } else if self.timerState.isTimerFinished() {
//
//                }
//            }
            
            
            Button(action: {
                self.timerState.started.toggle()
            }) {
                if !self.timerState.started {
                    Text("Start")
                }
                else{
                    Text("Stop")
                }
            }
        }
    }
}

struct TimerTextView_Previews: PreviewProvider {
    static var previews: some View {
        TimerTextView()
            .environmentObject(TimerState())
    }
}
