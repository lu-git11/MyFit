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
        .padding(.horizontal, 10)
    }
}

#Preview{
    ActivityCard(activityStatus: "Active", authStatus: "Authorized", isAuth: true)
    ActivityCard(activityStatus: "Normal", authStatus: "Not Authorized", isAuth: false)
    ActivityCard(activityStatus: "Sedentary", authStatus: "Pending", isAuth: false)
}
