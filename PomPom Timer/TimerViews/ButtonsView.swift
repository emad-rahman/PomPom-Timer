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
    var buttonWidth: CGFloat = 90
    var buttonHeight: CGFloat = 40
    
    var body: some View {
        HStack {
            Spacer()
            
            ZStack{
                Rectangle()
                    .frame(width: buttonWidth, height: buttonHeight)
                    .foregroundColor(.green)
                    .cornerRadius(10)
                
                Button(action: {
                    self.timerState.started.toggle()
                }) {
                    if !self.timerState.started {
                        HStack{
                            Image(systemName: "play.circle.fill")
                                .imageScale(.large)
                                .foregroundColor(.white)
                            Text("Start")
                                .fixedSize()
                                .foregroundColor(.white)
                        }
                    }
                    else{
                        Image(systemName: "pause.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(.white)
                        Text("Stop")
                            .foregroundColor(.white)
                    }
                }
            }
                
            Spacer()
            
            if !self.timerState.started {
                ZStack{
                    Rectangle()
                    .frame(width: buttonWidth, height: buttonHeight)
                    .foregroundColor(.gray)
                    .cornerRadius(10)
                    
                    Button(action: {
                        self.timerState.reset()
                    }) {
                        Image(systemName: "arrow.uturn.left.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(.white)
                        Text("Reset")
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
