//
//  ContentView.swift
//  MyFit
//
//  Created by jeffrey lullen on 5/19/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: HealthViewModel = HealthViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 15){
                    HeaderSection()
                    StepCard(steps: viewModel.steps)
                    DistanceCard(distance: viewModel.distance)
                    ActivityCard(activityStatus:
                                    viewModel.activityStatus, authStatus:
                                    viewModel.authStatus, isAuth:
                                    viewModel.isAuth)
                }
                .padding(2)
                .background(Color.orange)
                .ignoresSafeArea()
            }
            .navigationTitle("Health Tracker")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                viewModel.requestAuthorization()
            }
            .refreshable {
                viewModel.fetchSteps()
                viewModel.fetchDistance()
            }
        }
    }
        
    
}

#Preview {
    ContentView()
}
