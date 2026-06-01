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
        VStack(alignment: .leading, spacing: 5){
            HStack(spacing: 10){
                Image(systemName: "figure.walk.circle.fill")
                    .font(.system(size: 35, weight: .bold))
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(.orange)
                    .padding(6)
                    .background(.orange.opacity(0.12), in: RoundedRectangle(cornerRadius: 8))
                
                Text("Current Steps ").font(.headline)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundStyle(.orange)
                
                Spacer()
            }
            HStack(alignment: .firstTextBaseline, spacing: 6){
                Text("\(steps)")
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                Text("Steps")
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .baselineOffset(2)
                    .fontWeight(.bold)
            }
            ProgressView(value: Double(steps), total: Double(goal))
                .tint(.green)
            Text("Goal \(goal.formatted()) steps")
                .font(.caption)
                .foregroundColor(.orange)
                .fontWeight(.bold)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.ultraThinMaterial)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .strokeBorder(.black.opacity(0.12), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.06), radius: 12, x: 0, y: 6)
//        .cornerRadius(20)
        .padding(.horizontal, 10)
    }
}


#Preview {
    StepCard( steps:500 )
}

