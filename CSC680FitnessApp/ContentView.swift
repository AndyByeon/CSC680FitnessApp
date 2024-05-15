//
//  ContentView.swift
//  CSC680FitnessApp
//
//  Created by Andy Byeon on 3/28/24.
//
import SwiftUI

struct ContentView: View{
    
    @EnvironmentObject var manager: HealthManager
    let icons:[String] = ["timer.circle", "figure.walk.circle", "number.circle", "cross.circle"]
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                Text("Welcome").font(.largeTitle)
                
                HStack(spacing: 10){
                    NavigationLink(destination: TimerView()){
                        Image(systemName: icons[0])
                            .font(.largeTitle)
                            .symbolRenderingMode(.monochrome)
                            .foregroundColor(.purple)
                    }
                    
                    NavigationLink(destination: StepCounterView()){
                        Image(systemName: icons[1])
                            .font(.largeTitle)
                            .symbolRenderingMode(.monochrome)
                            .foregroundColor(.purple)
                    }
                    .environmentObject(manager)
                    
                    NavigationLink(destination: BMICalculatorView()){
                        Image(systemName: icons[3])
                            .font(.largeTitle)
                            .symbolRenderingMode(.monochrome)
                            .foregroundColor(.purple)
                    }
                }
            }
        }
    }
}



#Preview {
    ContentView()
}
