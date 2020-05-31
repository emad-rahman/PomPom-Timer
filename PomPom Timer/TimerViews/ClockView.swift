//
//  ClockView.swift
//  PomPom TImer
//
//  Created by Emad Rahman on 2020-05-24.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import SwiftUI

struct ClockView: View {
    var body: some View {
            
        ZStack {
            ZStack {
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke(Color("TimerCircleBackground"), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                    .frame(width: 280, height: 280)
                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(Color("TimerCircleForeground"), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                    .frame(width: 280, height: 280)
            }
            .rotationEffect(.init(degrees: -90))
        }
    }
    
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ClockView()
        }
    }
}
