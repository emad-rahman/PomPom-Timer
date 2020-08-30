//
//  DataContext.swift
//  PomPom Timer
//
//  Created by Emad Rahman on 2020-08-30.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import SwiftUI

final class DataContext {
    private let defaults = UserDefaults.standard
    
    private let shortBreakMinutesKey = "shortBreakMinutes"
    private let longBreakMinutesKey = "longBreakMinutes"
    private let focusMinutes = "focusMinutes"
    
    func SaveFocusMinutesToUserDefaults(focusMinutes: String) -> Void {
        defaults.set(focusMinutes, forKey: focusMinutes)
    }
    
    func SaveShortBreakMinutesToUserDefaults(breakMinutes: String) -> Void {
        defaults.set(breakMinutes, forKey: shortBreakMinutesKey)
    }
    
    func GetFocusMinutesFromUserDefaults() -> Int {
        let savedFocusMinutesString = defaults.string(forKey: focusMinutes)
        let savedFocusedMinutesInt: Int = Int(savedFocusMinutesString ?? "20") ?? 20
        
        return savedFocusedMinutesInt < 1 ? 20 : savedFocusedMinutesInt
    }
    
    func GetShortBreakMinutesFromUserDefaults() -> Int {
        let savedBreakMinutesString = defaults.string(forKey: shortBreakMinutesKey)
        let savedBreakMinutesInt: Int = Int(savedBreakMinutesString ?? "5") ?? 5
        
        return savedBreakMinutesInt < 1 ? 5 : savedBreakMinutesInt
    }
}
