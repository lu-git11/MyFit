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
        VStack(alignment: .leading, spacing: 15){
            HStack{
                Image(systemName: "map.circle.fill")
                    .font(.system(size:30))
                    .foregroundColor(.blue)
                    .foregroundColor(.blue)
                    
                
                Text("Distance")
                    .font(.headline)
                    .foregroundColor(.blue)
                
                Spacer()
            }
            
            HStack(alignment: .firstTextBaseline){
                Text(String(format: "%.2f", distance))
                    .font(.system(size:40, weight:.bold))
                    .foregroundColor(.primary)
                
                Text("miles")
                    .font(.title3)
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
            }
        }
        .padding()
        .background(Color(.green))
        .cornerRadius(20)
        .padding(4)
    }
}


#Preview {
    DistanceCard(distance: 20.10)
}
