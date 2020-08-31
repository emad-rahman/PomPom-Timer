//
//  SessionsView.swift
//  PomPom Timer
//
//  Created by Emad Rahman on 2020-08-30.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import SwiftUI

struct SessionsView: View {
    @EnvironmentObject var timerState: TimerState
    
    var body: some View {
        Text("Session: \(timerState.currentSession) / \(timerState.numberOfSessions)")
            .bold()
    }
}

struct SessionsView_Previews: PreviewProvider {
    static var previews: some View {
        SessionsView()
    }
}
