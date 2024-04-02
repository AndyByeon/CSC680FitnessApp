//
//  ContentView.swift
//  CSC680FitnessApp
//
//  Created by Andy Byeon on 3/28/24.
//

import SwiftUI

struct FirstView: View {
    
    
    let secondsOption = 0...60
    
    @State
    var defaultSecond = 0
    
    @State
    var timerRunning = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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

struct SecondView: View{
    var body: some View {
        NavigationView{
            Text("Second Screen")
        }
    }
}

struct ThirdView: View{
    var body: some View {
        NavigationView{
            Text("Third Screen")
        }
    }
}

struct ContentView: View{
    
    let icons:[String] = ["timer.circle", "figure.walk.circle", "circle.fill", ""]
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                Text("Welcome").font(.largeTitle)
                
                HStack(spacing: 10){
                    NavigationLink(destination: FirstView()){
                        Image(systemName: icons[0])
                            .font(.largeTitle)
                            .symbolRenderingMode(.monochrome)
                            .foregroundColor(.purple)
                    }
                    
                    NavigationLink(destination: SecondView()){
                        Image(systemName: icons[1])
                            .font(.largeTitle)
                            .symbolRenderingMode(.monochrome)
                            .foregroundColor(.purple)
                    }
                    
                    NavigationLink(destination: ThirdView()){
                        Image(systemName: icons[2])
                            .font(.largeTitle)
                            .symbolRenderingMode(.monochrome)
                            .foregroundColor(.purple)
                    }
                }
            }
        }
    }
}

//    .foregroundColor(.red)
#Preview {
    ContentView()
//    SecondView()
}
