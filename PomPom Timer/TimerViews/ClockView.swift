//
//  ClockView.swift
//  PomPom TImer
//
//  Created by Emad Rahman on 2020-05-24.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import SwiftUI

struct ClockView: View {
    @EnvironmentObject var timerState: TimerState
    @State var scale: CGFloat = 1
    
    var body: some View {
        ZStack {
            ZStack {
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke(Color("TimerCircleBackground"), style: StrokeStyle(lineWidth: 40, lineCap: .round))
                    .frame(width: 280, height: 280)
                
                ZStack {
                    if !self.timerState.complete {
                        Circle()
                            .trim(from: 0, to: CGFloat(self.timerState.progress()))
                            .stroke(Color("TimerCircleForeground"), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                            .rotationEffect(Angle(degrees: -90.0))
                            .frame(width: 280, height: 280)
                            .animation(.linear(duration: 0.05))
                    }
                    
                    if self.timerState.complete {
                        Circle()
                            .fill(Color("TimerCircleForeground"))
                            .frame(width: 1, height: 1)
                            .scaleEffect(self.scale)
                            .animation(.easeIn)
                            .onAppear {
                                self.scale = 300
                            }.onDisappear() {
                                self.scale = 1
                            }
                    }
                }
                .animation(.default)
            }
        }
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ClockView()
                .environmentObject(TimerState())
        }
    }
}
