//
//  TimerTextView.swift
//  PomPom Timer
//
//  Created by Emad Rahman on 2020-05-31.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import SwiftUI

struct TimerTextView: View {
    var timerState: TimerState
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text("\(self.timerState.secondsLeft)")
                .font(.largeTitle)
                .onReceive(timer) { input in
                    if self.timerState.secondsLeft > 0 && self.timerState.started {
                        self.timerState.secondsLeft -= 1
                        print("in loop")
                    } else {
                        print("not in loop")
                    }
            }
            
            
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
        TimerTextView(timerState: TimerState.init())
    }
}
