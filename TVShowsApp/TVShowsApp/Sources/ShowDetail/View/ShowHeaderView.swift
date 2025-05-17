//
//  ShowHeaderView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 11/05/2025.
//

import SwiftUI

struct ShowHeaderView: View {
    let imageURL: URL?
    let name: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            ShowImageView(imageURL: imageURL)
            ShowTitleView(name: name)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 46)
        .frame(maxWidth: .infinity)
        .frame(height: 192)
        .background(.black)
        .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 2)
        .overlay(
            RoundedRectangleView()
        )
        .padding(.horizontal, 46)
        .padding(.vertical, 8)
        .cornerRadius(8)
    }
}

private struct RoundedRectangleView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .stroke(Color.white.opacity(0.3), lineWidth: 1)
            .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    let data = ShowMapper.map(show: MockedData.shows[0])
    ShowHeaderView(imageURL: data.imageURL, name: data.name)
}
