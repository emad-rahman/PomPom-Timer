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

    var body: some View {
        VStack {
            HStack {
                Text("\((String.init(format: "%02d", self.timerState.minutesLeft)))")
                    .font(.largeTitle)
                    .bold()
                Text(":")
                    .font(.largeTitle)
                    .bold()
                Text("\((String.init(format: "%02d", self.timerState.secondsLeft)))")
                    .font(.largeTitle)
                    .bold()
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
