//
//  ClockView.swift
//  PomPom TImer
//
//  Created by Emad Rahman on 2020-05-24.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static var scaleAndFade: AnyTransition {
        AnyTransition.scale
            .combined(with: .opacity)
    }
}

struct ClockView: View {
    @EnvironmentObject var timerState: TimerState
    @State var scale: CGFloat = 1
    
    var body: some View {
        ZStack {
            ZStack {
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke(Color("TimerCircleBackground"), style: StrokeStyle(lineWidth: 45, lineCap: .round))
                    .frame(width: 280, height: 280)
                
                ZStack {
                    if !self.timerState.complete {
                        Circle()
                            .trim(from: 0, to: CGFloat(self.timerState.progress()))
                            .stroke(Color("TimerCircleForeground"), style: StrokeStyle(lineWidth: 40, lineCap: .round))
                            .rotationEffect(Angle(degrees: -90.0))
                            .animation(.linear(duration: 0.05))
                            .frame(width: 280, height: 280)
                            .transition(.opacity)
                            .animation(.default)
                    } else if self.timerState.complete {
                        Circle()
                            .fill(Color("TimerCircleForeground"))
                            .frame(width: 1, height: 1)
                            .scaleEffect(self.scale)
                            .transition(.scaleAndFade)
                            .onAppear {
                                self.scale = 300
                            }
                            .animation(.spring(response: 0.4, dampingFraction: 0.25))
                            .onDisappear() {
                                self.scale = 1
                            }
                            .animation(.easeOut)
                    }
                }
                
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
