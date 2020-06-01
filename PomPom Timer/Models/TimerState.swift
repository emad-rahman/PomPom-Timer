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
    @Published var secondsLeft: Int
    @Published var minutesLeft: Int
    
    @Published var started: Bool
    
    init() {
        secondsLeft = 60;
        minutesLeft = 20;
        started = false;
    }
    
    func isTimerFinished() -> Bool {
        return secondsLeft == 0 && minutesLeft == 0 && started
    }
    
    func progress() -> Double {
        return 1 - ((1200.0 - ((20.0 - Double(minutesLeft)) * 60) - ((60.0 - Double(secondsLeft)))) / 1200.0)
    }
}
