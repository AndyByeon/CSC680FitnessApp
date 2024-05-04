//
//  TimerView.swift
//  CSC680FitnessApp
//
//  Created by Andy Byeon on 4/29/24.
//
import SwiftUI

struct TimerView: View {
    let secondsOption = 0...60
    
    @State
    var defaultSecond = 0
    
    @State
    var timerRunning = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func vibrate() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }
    
    var body: some View {
        NavigationView{
            VStack(spacing: 30){
                Text("Timer").font(.system(size: 70))
                Picker("", selection: $defaultSecond) {
                    ForEach(secondsOption, id: \.self) { (selectedseconds: Int) in Text(String(selectedseconds))
                    }
                }
                
                Text("\(defaultSecond) sec").font(.system(size: 70)).onReceive(timer) { _ in
                    if defaultSecond > 0 && timerRunning {
                        defaultSecond -= 1
                    } else {
                        timerRunning = false
                    }
                }
                
                HStack(spacing: 30){
                    Button("Start") {
                        timerRunning = true
                        if defaultSecond == 0 {
                            vibrate()
                        }
                    }.disabled(defaultSecond == 0 || timerRunning == true).foregroundColor(.green)
                    
                    Button("Stop") {
                        timerRunning = false
                    }.disabled(defaultSecond == 0 || timerRunning == false).foregroundColor(.red)
                    
                    Button("Reset") {
                        defaultSecond = 0
                    }.disabled(defaultSecond == 0).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
            }
            .padding()
            .navigationTitle("")
        }
    }
}
