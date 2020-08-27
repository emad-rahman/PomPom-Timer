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
    @Published var secondsLeft: Int = 0
    @Published var minutesLeft: Int = 20
    
    @Published var started: Bool = false
    @Published var complete: Bool = false
    
    private var currentDate: Date = Date()
    private let defaults = UserDefaults.standard
    
    init() {}
    
    func isTimerFinished() -> Bool {
        return secondsLeft == 0 && minutesLeft == 0 && started
    }
    
    func progress() -> Double {
        let ret = 1 - ((1200.0 - ((20.0 - Double(minutesLeft)) * 60) - ((0.0 - Double(secondsLeft)))) / 1200.0)
        return ret
    }
    
    func reset() {
        let savedFocusMinutesString = defaults.string(forKey: "focusMinutes")
        let savedFocusedMinutesInt: Int = Int(savedFocusMinutesString ?? "20") ?? 20
        
        secondsLeft = 0
        minutesLeft = savedFocusedMinutesInt < 1 ? 20 : savedFocusedMinutesInt
//        minutesLeft = 0
        started = false
        complete = false
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
