//
//  TimerStateHelper.swift
//  PomPom Timer
//
//  Created by Emad Rahman on 2020-09-02.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import SwiftUI

class TimerStateHelper {
    private var dataContext = DataContext()
//    static func isTimerFinished(timerState: TimerState) -> Bool {
//        return timerState.secondsLeft == 0 && timerState.minutesLeft == 0 && timerState.started
//    }
    
    func timerProgress(timerState: TimerState) -> Double {
        let focusMinutes = Double(dataContext.GetFocusMinutesFromUserDefaults())
        
        let maxTicks = focusMinutes * 60
        let minuteTicks = Double(timerState.minutesLeft) * 60
        let secondTicks = Double(timerState.secondsLeft)
        let ticksLeft = minuteTicks + secondTicks
        
        let timerProgress = 1 - (ticksLeft / maxTicks)
        
        return timerProgress
    }
    
    func resetTimer(timerState: TimerState) -> Void {
        timerState.secondsLeft = TimerConstants.defaultFocusSeconds
        timerState.minutesLeft = dataContext.GetFocusMinutesFromUserDefaults()
        timerState.started = false
        timerState.complete = false
        timerState.numberOfSessions = dataContext.GetNumberOfSessionsFromUserDefaults()
        timerState.currentSession = 1
    }
}
