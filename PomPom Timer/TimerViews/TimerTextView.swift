//
//  TimerTextView.swift
//  PomPom Timer
//
//  Created by Emad Rahman on 2020-05-31.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import SwiftUI

struct TimerTextView: View {
    var body: some View {
        Text("1:00")
            .font(.largeTitle)
            .fontWeight(.black)
    }
}

struct TimerTextView_Previews: PreviewProvider {
    static var previews: some View {
        TimerTextView()
    }
}
