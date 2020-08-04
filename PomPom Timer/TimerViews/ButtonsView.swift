//
//  ButtonsView.swift
//  PomPom Timer
//
//  Created by Emad Rahman on 2020-05-31.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import SwiftUI
import UserNotifications

extension AnyTransition {
    static var moveAndFadeRight: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.move(edge: .trailing)
            .combined(with: opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
    static var moveAndFadeLeft: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .opacity)
        let removal = AnyTransition.move(edge: .leading)
            .combined(with: opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct ButtonsView: View {
    @EnvironmentObject var timerState: TimerState
    var buttonWidth: CGFloat = 120
    var buttonHeight: CGFloat = 60
    var cornerRadius: CGFloat = 15
    
    var body: some View {
        HStack {
            Spacer()
            
            if !self.timerState.complete {
                Button(action: {
                    withAnimation {
                        self.timerState.started.toggle()
                    }
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .frame(width: buttonWidth, height: buttonHeight)
                            .foregroundColor(Color("TimerCircleForeground"))
                        
                        HStack{
                            if !self.timerState.started {
                                    Image(systemName: "play.circle.fill")
                                        .imageScale(.large)
                                        .foregroundColor(.white)
                                    Text("Start")
                                        .bold()
                                        .fixedSize()
                                        .foregroundColor(.white)
                                
                            } else {
                                Image(systemName: "pause.circle.fill")
                                    .imageScale(.large)
                                    .foregroundColor(.white)
                                Text("Stop")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                .transition(.moveAndFadeLeft)
                
                Spacer()
            }
            
            if !self.timerState.started {
                Button(action: {
                    withAnimation {
                        self.timerState.reset()
                    }
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: cornerRadius)
                           .frame(width: buttonWidth, height: buttonHeight)
                           .foregroundColor(Color(.lightGray))
                        
                        HStack {
                            Image(systemName: "arrow.uturn.left.circle.fill")
                                .imageScale(.large)
                                .foregroundColor(.white)
                            Text("Reset")
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                }
                .transition(.moveAndFadeRight)
                
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
