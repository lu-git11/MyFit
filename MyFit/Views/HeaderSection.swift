//
//  HeaderSection.swift
//  MyFit
//
//  Created by jeffrey lullen on 5/19/26.
//

import SwiftUI

struct HeaderSection: View{
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: "figure.walk")
                .font(.system(size:90))
                .foregroundColor(.orange)
            
            Text("Daily Activity Tracker")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Monitor Health Data")
                .font(.headline)
                .foregroundColor(.gray)
        }
        .padding(5)
        .padding(20)
    }
}

#Preview{
    HeaderSection()
}
