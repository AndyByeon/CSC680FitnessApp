//
//  BMICalculatorView.swift
//  CSC680FitnessApp
//
//  Created by Andy Byeon on 4/29/24.
//

import SwiftUI


struct BMICalculatorView: View{
    @State
    var feet = ""
    
    @State
    var inches = ""
    
    @State
    var pounds = ""
    
    @State
    var BMI = 0.0
    
    func convertFeetAndInchesToInches() -> Int{
        guard let feet = Int(feet),
                
              let inches = Int(inches)
                
        else { return 0 }
        
        return feet * 12 + inches
    }
    
    func convertInchesToMeters(_ inches: Int) -> Double {
            return Double(inches) * 0.0254
        }
    
    func convertPoundsToKilograms(_ pounds: String) -> Double {
            guard let weight = Double(pounds)
                
            else { return 0 }
        
            return weight * 0.453592
        }
    
    func calculateBMI() {
            let heightInInches = convertFeetAndInchesToInches()
        
            let heightInMeters = convertInchesToMeters(heightInInches)
        
            let weightInKilograms = convertPoundsToKilograms(pounds)
        
            BMI = weightInKilograms / (heightInMeters * heightInMeters)
        
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    var body: some View {
        NavigationView{
            VStack(spacing: 10){
                VStack(spacing: 70){
                    Text("BMI Categories: \nUnderweight = <18.5 \nNormal weight = 18.5–24.9 \nOverweight = 25–29.9 \nObesity = BMI of 30 or greater")
                    HStack(spacing: 5){
                        Text("Your Height: ")
                        TextField("feet", text: $feet).frame(width: 50,height: 20,alignment: .center).border(Color.yellow, width: 1).keyboardType(.numberPad)
                        TextField("inches", text: $inches).frame(width: 60,height: 20,alignment: .center).border(Color.yellow, width: 1).keyboardType(.numberPad)
                    }
                }
                
                HStack{
                    Text("Your Weight: ")
                    TextField("pounds", text: $pounds).frame(width: 110,height: 25,alignment: .center).border(Color.yellow, width: 1).keyboardType(.numberPad)
                }
                Button("Calculate BMI") {
                    calculateBMI()
                }.disabled(feet .isEmpty || inches .isEmpty || pounds .isEmpty)
                Text("Your BMI is: \(String(format: "%.1f", BMI))")
            }
        }
    }
}
