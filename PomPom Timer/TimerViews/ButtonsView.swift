//
//  ButtonsView.swift
//  PomPom Timer
//
//  Created by Emad Rahman on 2020-05-31.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import SwiftUI

struct ButtonsView: View {
    @EnvironmentObject var timerState: TimerState
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                self.timerState.started.toggle()
            }) {
                if !self.timerState.started {
                    Image(systemName: "play.circle.fill")
                        .imageScale(.large)
                    Text("Start")
                }
                else{
                    Image(systemName: "pause.circle.fill")
                        .imageScale(.large)
                    Text("Stop")
                }
            }
                
            Spacer()
            
            Button(action: {
                self.timerState.reset()
            }) {
                Image(systemName: "arrow.uturn.left.circle.fill")
                    .imageScale(.large)
                Text("Reset")
            }
            
            Spacer()
        }
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
            .environmentObject(TimerState())
    }
}
