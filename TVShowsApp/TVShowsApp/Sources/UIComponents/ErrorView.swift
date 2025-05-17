//
//  ErrorView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 13/05/2025.
//

import SwiftUI

import SwiftUI

struct ErrorView: View {
    let error: ErrorViewData
    
    var body: some View {
        VStack(spacing: 20) {
            Text(error.title)
                .font(.title3)
                .bold()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            optionalContentView
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
    
    @ViewBuilder
    private var optionalContentView: some View {
        if let message = error.message {
            MessageView(text: message)
        }
        
        if let action = error.action {
            ButtonView(action: action, text: "Try again")
        }
    }
}

private struct MessageView: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.body)
            .multilineTextAlignment(.center)
            .foregroundColor(.gray)
    }
}

private struct ButtonView: View {
    let action: () -> Void
    let text: String
    
    var body: some View {
        VStack {
            Button(action: action) {
                Text(text)
                    .padding()
                    .foregroundColor(.white)
                    .frame(height: 34)
                    .frame(maxWidth: 120)
                    .background(Color.secondary)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
        }
    }
}


struct ErrorViewData {
    let title: String
    let message: String?
    let action: (() -> Void)?
}

#Preview {
    let error = ErrorViewData(title: "Something went wrong", message: "You're offline. Please check your internet connection.", action: {})
    ErrorView(error: error)
}
