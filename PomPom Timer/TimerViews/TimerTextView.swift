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
    @State var scale: CGFloat = 4

    var body: some View {
        VStack {
            HStack {
                if self.timerState.complete {
                    HStack(spacing: 10) {
                        Text("Done")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .bold()
                        Image(systemName: "checkmark.square.fill")
                            .foregroundColor(.white)
                            .imageScale(.large)
                    }
                    .scaleEffect(self.scale)
                    .transition(.scaleAndFade)
                    .onAppear() {
                        self.scale = 1.5
                    }
                    .animation(.easeOut)
                    .onDisappear() {
                        self.scale = 4
                    }
                } else {
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
                    .transition(.scaleAndFade)
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
