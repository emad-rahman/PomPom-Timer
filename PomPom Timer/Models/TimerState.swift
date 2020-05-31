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
    @Published var secondsLeft = 60
    @Published var started = false
    
    init(){
        secondsLeft = 60;
        started = false;
    }
}
