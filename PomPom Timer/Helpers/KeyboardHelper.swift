//
//  TextFieldViewController.swift
//  PomPom Timer
//
//  Created by Emad Rahman on 2020-08-14.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import SwiftUI

class KeyboardHelper {
    func hideKeyboard()
    {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
