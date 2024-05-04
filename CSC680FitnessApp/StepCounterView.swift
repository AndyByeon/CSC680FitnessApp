//
//  StepCounterView.swift
//  CSC680FitnessApp
//
//  Created by Andy Byeon on 4/30/24.
//
// https://www.youtube.com/watch?v=7vOF1kGnsmo&t=506s

// followed this youtube video to start healthkit
import HealthKit
import SwiftUI

extension Date {
    static var startDay: Date {
        Calendar.current.startOfDay(for: Date())
    }
}
class HealthManager: ObservableObject {
    
    let healthStore = HKHealthStore()
    
    @Published
    var stepCount: Double = 0
    init () {
        let steps = HKQuantityType(.stepCount)
        
        let healthTypes: Set = [steps]
        Task {
            do {
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
            } catch {
                print("was not able to fetch data")
            }
        }
    }
    
    func fetchSteps(completion: @escaping (Double) -> Void) {
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startDay, end: Date())
        let query = HKStatisticsQuery (quantityType: steps, quantitySamplePredicate: predicate) { _, res, error in
            guard let quantity = res?.sumQuantity(), error == nil else {
                print("error fetching data")
                return
            }
            let stepCount = quantity.doubleValue(for: .count())
            completion(stepCount)
        }
        healthStore.execute(query)
    }
    
    func updatingSteps(){
        Timer.scheduledTimer(withTimeInterval: 15, repeats: true) { _ in
                    self.fetchSteps { stepCount in
                        DispatchQueue.main.async {
                            self.stepCount = stepCount
                        }
                    }
                }
            }
}


struct StepCounterView: View{
    @EnvironmentObject var manager: HealthManager
    
    var body: some View {
        NavigationView{
            VStack{
                Text(String(format: "Today's Step Count: \n %.0f", manager.stepCount))
            }
            .font(.system(size: 40))
            .onAppear {
                manager.updatingSteps()
            }
        }
    }
}

