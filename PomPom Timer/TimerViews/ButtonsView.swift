//
//  ButtonsView.swift
//  PomPom Timer
//
//  Created by Emad Rahman on 2020-05-31.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import SwiftUI
import UserNotifications

struct ButtonsView: View {
    @EnvironmentObject var timerState: TimerState
    var buttonWidth: CGFloat = 120
    var buttonHeight: CGFloat = 60
    var cornerRadius: CGFloat = 15
    
    var body: some View {
        HStack {
            Spacer()
            
            ZStack{
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: buttonWidth, height: buttonHeight)
                    .foregroundColor(Color("TimerCircleForeground"))
                
                Button(action: {
                    self.timerState.started.toggle()
                }) {
                    if !self.timerState.started {
                        HStack{
                            Image(systemName: "play.circle.fill")
                                .imageScale(.large)
                                .foregroundColor(.white)
                            Text("Start")
                                .bold()
                                .fixedSize()
                                .foregroundColor(.white)
                        }
                    }
                    else{
                        Image(systemName: "pause.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(.white)
                        Text("Stop")
                            .bold()
                            .foregroundColor(.white)
                    }
                }
            }
                
            Spacer()
            
            if !self.timerState.started {
                ZStack{
                    RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: buttonWidth, height: buttonHeight)
                        .foregroundColor(Color(.lightGray))
                    
                    Button(action: {
                        self.timerState.reset()
                    }) {
                        Image(systemName: "arrow.uturn.left.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(.white)
                        Text("Reset")
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                Spacer()
            }
        }
        .animation(.easeInOut)
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
            .environmentObject(TimerState())
    }
}
