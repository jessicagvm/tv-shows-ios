//
//  EmptyStateView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 13/05/2025.
//

import SwiftUI

struct EmptyStateView: View {
    let title: String
    let message: String?
    
    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .foregroundColor(.white)
                .bold()
                .multilineTextAlignment(.center)
            messageView
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
    @ViewBuilder
        private var messageView: some View {
            if let message {
                Text(message)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
        }
}

#Preview {
    EmptyStateView(title: "No shows found", message: "Try searching again with different keywords.")
}
