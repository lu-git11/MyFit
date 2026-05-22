//
//  HealthViewModel.swift
//  MyFit
//
//  Created by jeffrey lullen on 5/19/26.
//

import Foundation
import HealthKit
import Combine

class HealthViewModel: ObservableObject{
    
    @Published var steps: Int = 4000
    @Published var distance: Double = 2.32
    @Published var activityStatus: String = "Active"
    @Published var authStatus: String = "Authorized"
    @Published var isAuth: Bool = true
    
    private let healthStore:HKHealthStore = HKHealthStore()
    
    init(){
        checkHealthDataAvailalbe()
    }
    
    private func checkHealthDataAvailalbe(){
        if HKHealthStore.isHealthDataAvailable(){
            print("Data ready")
        } else {
            print("Data not ready")
            authStatus = "Not avaialable"
        }
    }
    
    private func updateActivityStatus(){
        if steps < 2000{
            activityStatus = "Sleepy"
        } else if steps < 5000{
            activityStatus = "Average"
        } else if steps < 7000{
            activityStatus = "Moderate"
        } else if steps < 9000{
            activityStatus = "Active"
        } else if steps >= 9000{
            activityStatus = "Superstar"
        }
    }
    
    func requestAuthorization(){
        let typeToRead:Set<HKObjectType> = [
            HKObjectType.quantityType(forIdentifier: .stepCount)!,
            HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
            HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!
        ]
        
        healthStore.requestAuthorization(toShare: nil, read: typeToRead) { success, error in
            DispatchQueue.main.async {
                if success{
                    self.isAuth = true
                    self.authStatus = "Authorized"
                    
                    self.fetchSteps()
                    self.fetchDistance()
                    
                } else {
                    self.isAuth = false
                    self.authStatus = "Not Authorized"
                    
                    if let error = error{
                        print("Error: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    func fetchSteps(){
        
        guard let stepCountType = HKObjectType.quantityType(forIdentifier: .stepCount) else {
            print("Not Steps/ not available")
            return
        }
        let now = Date()
        let startOfTheDay = Calendar.current.startOfDay(for:now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfTheDay, end: now, options: .strictStartDate)
        let query = HKStatisticsQuery(quantityType: stepCountType, quantitySamplePredicate: predicate, options: .cumulativeSum) {
            query, result, error in
           
            DispatchQueue.main.async {
                if let error = error {
                    print("Fetching steps")
                    self.steps = 0
                    self.updateActivityStatus()
                    return
                }
                
                if let result = result , let sum = result.sumQuantity(){
                    let steps = Int(sum.doubleValue(for: .count()))
                    self.steps = steps
                    self.updateActivityStatus()
                    print("Fetch: \(steps)")
                } else {
                    self.steps = 0
                    self.updateActivityStatus()
                }
            }
        }
        healthStore.execute(query)
    }
    
    func fetchDistance(){
        
        guard let distanceType = HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning) else {
            print("Not Steps/ not available")
            return
        }
        let now = Date()
        let startOfTheDay = Calendar.current.startOfDay(for:now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfTheDay, end: now, options: .strictStartDate)
        let query = HKStatisticsQuery(quantityType: distanceType, quantitySamplePredicate: predicate, options: .cumulativeSum) {
            query, result, error in
           
            DispatchQueue.main.async {
                if let error = error {
                    print("Fetching steps")
                    self.distance = 0.0
                    return
                }
                
                if let result = result , let sum = result.sumQuantity(){
                    let distanceInMeter = sum.doubleValue(for: .meter())
                    let distanceInKilo = distanceInMeter / 1000
                    self.distance = distanceInMeter
                    print("KM: \(distanceInKilo) . \(distanceInMeter)")
                } else {
                    self.distance = 0.0
                }
            }
        }
        healthStore.execute(query)
    }
    
    func startObservingSteps(){
            
        guard let stepCountType = HKObjectType.quantityType(forIdentifier: .stepCount) else {
            print("Not Steps/ not available")
            return
            }

        let query = HKObserverQuery(sampleType: stepCountType, predicate: nil) {
                query, completionHandler, error in
               
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
                }
            
                self.fetchSteps()
                self.fetchDistance()
                
                completionHandler()
            }
            healthStore.execute(query)
        }
}


