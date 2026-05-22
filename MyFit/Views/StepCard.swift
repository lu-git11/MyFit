//
//  StepCard.swift
//  MyFit
//
//  Created by jeffrey lullen on 5/19/26.
//

import SwiftUI

struct StepCard: View {
    
    let goal:Int = 10000
    let steps:Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            HStack{
                Image(systemName: "figure.walk.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                Text("Current Steps ").font(.headline)
                    .foregroundStyle(.orange)
                    .fontWeight(.bold)
                Spacer()
                
            }
            HStack(alignment: .firstTextBaseline){
                Text("\(steps)")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.primary)
                Text("Steps")
                    .font(.title)
                    .foregroundColor(.orange)
                    .fontWeight(.bold)
            }
            ProgressView(value: Double(steps), total: Double(goal))
                .tint(.green)
            Text("Goal \(goal.formatted()) steps")
                .font(.caption)
                .foregroundColor(.orange)
                .fontWeight(.bold)
        }
        .padding()
        .background(Color(.systemBlue))
        .cornerRadius(20)
        .padding(4)
    }
}


#Preview {
    StepCard( steps:500 )
}
