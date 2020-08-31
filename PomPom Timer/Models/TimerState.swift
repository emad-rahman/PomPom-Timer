//
//  TimerState.swift
//  PomPom Timer
//
//  Created by Emad Rahman on 2020-05-31.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import Combine
import SwiftUI

final class TimerState: ObservableObject {
    @Published var secondsLeft: Int = TimerConstants.defaultFocusSeconds
    @Published var minutesLeft: Int = TimerConstants.defaultFocusMinutes
    
    @Published var shortBreakSecondsLeft: Int = TimerConstants.defaultShortBreakSeconds
    @Published var shortBreakMinutesLeft: Int = TimerConstants.defaultShortBreakMinutes
    @Published var longBreakSecondsLeft: Int = TimerConstants.defaultLongBreakSeconds
    @Published var longBreakMinutesLeft: Int = TimerConstants.defaultLongBreakMinutes
    
    @Published var numberOfSessions: Int = TimerConstants.defaultNumberOfSessions
    @Published var currentSession: Int = 1
    
    @Published var started: Bool = false
    @Published var complete: Bool = false
    
    private var currentDate: Date = Date()
    
    private var dataContext = DataContext()
    
    init() {
        
    }
    
    func isTimerFinished() -> Bool {
        return secondsLeft == 0 && minutesLeft == 0 && started
    }
    
    func progress() -> Double {
        let ret = 1 - ((1200.0 - ((20.0 - Double(minutesLeft)) * 60) - ((0.0 - Double(secondsLeft)))) / 1200.0)
        return ret
    }
    
    func reset() {
        secondsLeft = 0
        minutesLeft = dataContext.GetFocusMinutesFromUserDefaults()
        started = false
        complete = false
        numberOfSessions = dataContext.GetNumberOfSessionsFromUserDefaults()
        currentSession = 1
    }
    
    func update() {
        if started {
            subtractSeconds(secondsToSubtract: 1)
        } else if complete {
            // do something
        }
    }
    
    func setStateForBackground() {
        currentDate = Date()
    }
    
    func setStateForForeground() {
        if !started || complete {
            return
        }
        
        let timeInterval = (currentDate.timeIntervalSinceNow) * -1
        
        let minutesElapsedInBackground: Int = Int(timeInterval / 60)
        let secondsElapsedInBackground: Int = Int(timeInterval.truncatingRemainder(dividingBy: 60))
            
        subtractMinutes(minutesToSubtract: minutesElapsedInBackground)
        subtractSeconds(secondsToSubtract: secondsElapsedInBackground)
    }
    
    func subtractMinutes(minutesToSubtract : Int) -> Void {
        if minutesLeft < minutesToSubtract {
            minutesLeft = 0
        } else {
            minutesLeft -= minutesToSubtract
        }
    }
    
    func subtractSeconds(secondsToSubtract: Int) -> Void {
        if secondsLeft < secondsToSubtract && minutesLeft == 0 {
            secondsLeft = 0
            started = false
            complete = true
        } else if secondsLeft < secondsToSubtract {
            minutesLeft -= 1
            secondsLeft = 60 - (secondsToSubtract - secondsLeft)
        } else {
            secondsLeft -= secondsToSubtract
        }
    }
    
    func remainingTimeInSeconds() -> Double {
        return Double((minutesLeft * 60) + secondsLeft)
    }
}
