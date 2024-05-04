//
//  ContentView.swift
//  CSC680FitnessApp
//
//  Created by Andy Byeon on 3/28/24.
//
import SwiftUI

//struct FirstView: View {
//    
//    let secondsOption = 0...60
//    
//    @State
//    var defaultSecond = 0
//    
//    @State
//    var timerRunning = false
//    
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//    
//    func vibrate() {
//        let generator = UIImpactFeedbackGenerator(style: .heavy)
//        generator.impactOccurred()
//    }
//    
//    var body: some View {
//        NavigationView{
//            VStack(spacing: 30){
//                Text("Timer").font(.system(size: 70))
//                Picker("", selection: $defaultSecond) {
//                    ForEach(secondsOption, id: \.self) { (selectedseconds: Int) in Text(String(selectedseconds))
//                    }
//                }
//                
//                Text("\(defaultSecond) sec").font(.system(size: 70)).onReceive(timer) { _ in
//                    if defaultSecond > 0 && timerRunning {
//                        defaultSecond -= 1
//                    } else {
//                        timerRunning = false
//                    }
//                }
//                
//                HStack(spacing: 30){
//                    Button("Start") {
//                        timerRunning = true
//                        if defaultSecond == 0 {
//                            vibrate()
//                        }          
//                    }.disabled(defaultSecond == 0 || timerRunning == true).foregroundColor(.green)
//                    
//                    Button("Stop") {
//                        timerRunning = false
//                    }.disabled(defaultSecond == 0 || timerRunning == false).foregroundColor(.red)
//                    
//                    Button("Reset") {
//                        defaultSecond = 0
//                    }.disabled(defaultSecond == 0).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//                }
//            }
//            .padding()
//            .navigationTitle("")
//        }
//    }
//}



struct SecondView: View{
    var body: some View {
        NavigationView{
            Text("Second Screen")
        }
    }
}



//struct BMICalculatorView: View{
//    
//    @State
//    var feet = ""
//    
//    @State
//    var inches = ""
//    
//    @State
//    var pounds = ""
//    
//    @State
//    var BMI = 0.0
//    
//    func convertFeetAndInchesToInches() -> Int{
//        guard let feet = Int(feet), 
//                
//              let inches = Int(inches)
//                
//        else { return 0 }
//        
//        return feet * 12 + inches
//    }
//    
//    func convertInchesToMeters(_ inches: Int) -> Double {
//            return Double(inches) * 0.0254
//        }
//    
//    func convertPoundsToKilograms(_ pounds: String) -> Double {
//            guard let weight = Double(pounds) 
//                
//            else { return 0 }
//        
//            return weight * 0.453592
//        }
//    
//    func calculateBMI() {
//            let heightInInches = convertFeetAndInchesToInches()
//        
//            let heightInMeters = convertInchesToMeters(heightInInches)
//        
//            let weightInKilograms = convertPoundsToKilograms(pounds)
//        
//            BMI = weightInKilograms / (heightInMeters * heightInMeters)
//        
//            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//        }
//    var body: some View {
//        NavigationView{
//            VStack(spacing: 10){
//                VStack(spacing: 70){
//                    Text("BMI Categories: \nUnderweight = <18.5 \nNormal weight = 18.5–24.9 \nOverweight = 25–29.9 \nObesity = BMI of 30 or greater")
//                    HStack(spacing: 5){
//                        Text("Your Height: ")
//                        TextField("feet", text: $feet).frame(width: 50,height: 20,alignment: .center).border(Color.yellow, width: 1).keyboardType(.numberPad)
//                        TextField("inches", text: $inches).frame(width: 60,height: 20,alignment: .center).border(Color.yellow, width: 1).keyboardType(.numberPad)
//                    }
//                }
//                
//                HStack{
//                    Text("Your Weight: ")
//                    TextField("pounds", text: $pounds).frame(width: 110,height: 25,alignment: .center).border(Color.yellow, width: 1).keyboardType(.numberPad)
//                }
//                Button("Calculate BMI") {
//                    calculateBMI()
//                }.disabled(feet .isEmpty || inches .isEmpty || pounds .isEmpty)
//                Text("Your BMI is: \(String(format: "%.2f", BMI))")
//            }
//        }
//    }
//}



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
