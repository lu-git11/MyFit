//
//  DistanceCard.swift
//  MyFit
//
//  Created by jeffrey lullen on 5/19/26.
//

import SwiftUI

struct DistanceCard: View {
    
    let distance: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            HStack(spacing: 10){
                Image(systemName: "map.circle.fill")
                    .font(.system(size:28, weight: .semibold))
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(.blue)
                    .padding(3)
                    .background(.blue.opacity(0.12), in: RoundedRectangle(cornerRadius: 8))
                    
                
                Text("Distance")
                    .font(.headline)
                    .foregroundStyle(.blue)
                
                Spacer()
            }
            
            HStack(alignment: .firstTextBaseline, spacing: 6){
                Text(distance, format: .number.precision(.fractionLength(2)))
                    .font(.system(size:40, weight:.bold, design: .rounded))
                    .foregroundColor(.primary)
                
                Text("miles")
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .baselineOffset(2)
                    .fontWeight(.bold)
            }
        }
        .padding(10)
        .background(LinearGradient(colors: [.white, .white.opacity(0.96)],
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
        )
        .cornerRadius(20)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.ultraThinMaterial)
        )
        .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
            .strokeBorder(.gray.opacity(0.12), lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.06), radius: 12, x: 0, y: 6)
        .padding(.horizontal, 10)
    }
}


#Preview {
    DistanceCard(distance: 20.10)
    DistanceCard(distance: 2.10)
}



