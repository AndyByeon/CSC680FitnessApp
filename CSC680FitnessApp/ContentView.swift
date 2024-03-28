//
//  ContentView.swift
//  CSC680FitnessApp
//
//  Created by Andy Byeon on 3/28/24.
//

import SwiftUI

struct ContentView: View {
    let secondsOption = 0...60
    
    @State
    var defaultSecond = 0
    
    var body: some View {
        VStack {
            Text("Welcome to the timer section of the app.").foregroundColor(.blue)
            Text("Select the amount of seconds for the timer.").foregroundColor(.blue)
            
            HStack{
                Picker("", selection: $defaultSecond) {
                    ForEach(secondsOption, id: \.self) { (selectedseconds: Int) in Text(String(selectedseconds))
                        
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
