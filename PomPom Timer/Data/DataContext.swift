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

    func GetFocusMinutesFromUserDefaults() -> Int {
        let savedFocusMinutesString = defaults.string(forKey: "focusMinutes")
        let savedFocusedMinutesInt: Int = Int(savedFocusMinutesString ?? "20") ?? 20
        
        return savedFocusedMinutesInt < 1 ? 20 : savedFocusedMinutesInt
    }
}
