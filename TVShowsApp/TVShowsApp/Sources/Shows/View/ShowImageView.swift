//
//  ShowImageView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 16/05/2025.
//

import SwiftUI

struct ShowImageView: View {
    let imageURL: URL?
    var body: some View {
        AsyncRemoteImage(url: imageURL)
            .foregroundColor(.secondary)
            .frame(height: 120)
            .frame(maxWidth: 100)
            .clipped()
            .cornerRadius(8)
            .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 2)
    }
}
