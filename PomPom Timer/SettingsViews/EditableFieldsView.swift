//
//  EditableFieldsView.swift
//  PomPom Timer
//
//  Created by Emad Rahman on 2020-08-15.
//  Copyright © 2020 Emad Rahman. All rights reserved.
//

import SwiftUI
import CoreData

struct EditableFieldsView: View {
    @State private var focusMinutes: Int = 45
    @State private var breakMinutes: Int = 45
    
    private let defaults = UserDefaults.standard
    
    var body: some View {
        Section(header: Text("Focus Timer Settings")) {
            HStack {
                Text("Focus Minutes")
                Spacer()
                TextField("20", value: $focusMinutes, formatter: NumberFormatter())
                    .frame(width: 40, height: 30)
                    .foregroundColor(.primary)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                Text("mins")
            }
            
            HStack {
                Text("Break Minutes")
                Spacer()
                TextField("5", value: $breakMinutes, formatter: NumberFormatter())
                    .frame(width: 40, height: 30)
                    .foregroundColor(.primary)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                Text("mins")
            }
        }
        .onAppear() {
            load()
        }
    }
    
    

    
    func load() {
        let savedFocusMinutes = defaults.integer(forKey: "focusMinutes")
        let savedBreakMinutes = defaults.integer(forKey: "breakMinutes")
        
        focusMinutes = savedFocusMinutes
        breakMinutes = savedBreakMinutes
    }
    
    
    
    
    
    
    
    
    
}

struct EditableFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        EditableFieldsView()
    }
}
