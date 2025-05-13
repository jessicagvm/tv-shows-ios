//
//  ErrorView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 13/05/2025.
//

import SwiftUI

import SwiftUI

struct ErrorView: View {
    let title: String
    let message: String?
    let action: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.title3)
                .bold()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            if let message = message {
                Text(message)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            }
            
            if let action = action {
                Button(action: action) {
                    Text("Try again")
                        .padding()
                        .frame(height: 34)
                        .frame(maxWidth: 120)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

#Preview {
    ErrorView(title: "Something went wrong", message: "You're offline. Please check your internet connection.", action: {})
}
