//
//  Timer.swift
//  PomPom TImer
//
//  Created by Emad Rahman on 2020-05-24.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                SessionsView()
                Spacer()
                ZStack {
                    ClockView()
                    TimerTextView()
                }
                .padding(.bottom, 50)
                
                Spacer()
                ButtonsView()
                Spacer()
            }
            .navigationBarTitle("PomPom Timer", displayMode: .inline)
        }
    }
}

struct Timer_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(TimerState())
    }
}
