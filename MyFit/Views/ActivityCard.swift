//
//  ActivityCard.swift
//  MyFit
//
//  Created by jeffrey lullen on 5/19/26.
//

import SwiftUI

struct ActivityCard: View {
    
    var activityStatus: String
    var authStatus: String
    var isAuth: Bool
    
    var body: some View {
        VStack(alignment:.leading, spacing: 15){
            HStack{
                Image(systemName: "heart.circle.fill")
                    .font(.title2)
                    .foregroundStyle(.red)
                Text("Activity Status")
                    .font(.headline)
                Spacer()
                
            }
            HStack{
                Text("Status:")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                Text("\(activityStatus)")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            HStack{
                Text("Authorization Status:")
                    .font(.body)
                    .foregroundColor(.gray)
                
                Text(authStatus)
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(isAuth ? .green : .orange)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(20)
        .padding(4)
    }
}

#Preview{
    ActivityCard(activityStatus: "Active", authStatus: "Authorized", isAuth: true)
    ActivityCard(activityStatus: "Normal", authStatus: "Not Authorized", isAuth: false)
    ActivityCard(activityStatus: "Sedentary", authStatus: "Pending", isAuth: false)
}
