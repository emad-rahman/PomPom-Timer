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
//        if UITraitCollection.current.userInterfaceStyle == .dark {
//            print("Dark mode")
//        }
//        else {
//            print("Light mode")
//        }
    
        
        ZStack {
            if UITraitCollection.current.userInterfaceStyle == .light {
                Circle()
                .trim(from: 0, to: 1)
                .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                .frame(width: 280, height: 280)
            } else {
                Circle()
                .trim(from: 0, to: 1)
                    .stroke(Color.white.opacity(0.25), style: StrokeStyle(lineWidth: 35, lineCap: .round))
                .frame(width: 280, height: 280)
            }
            
            
            Circle()
                .trim(from: 0, to: 0.5)
                .stroke(Color.red, style: StrokeStyle(lineWidth: 35, lineCap: .round))
                .frame(width: 280, height: 280)
        }
        .rotationEffect(.init(degrees: -90))
    }
    
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ClockView()
                .environment(\.colorScheme, .light)
            ClockView()
                .environment(\.colorScheme, .dark)
        }
    }
}
