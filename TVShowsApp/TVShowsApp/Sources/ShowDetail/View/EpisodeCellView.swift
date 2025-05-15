//
//  EpisodeCellView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 11/05/2025.
//

import SwiftUI

struct EpisodeCellView: View {
    let episode: EpisodeCellViewData
    
    var body: some View {
        HStack(spacing: 12) {
            Spacer()
            AsyncRemoteImage(url: episode.imageURL)
                .foregroundColor(.secondary)
                .frame(width: 74, height: 100)
                .clipped()
                .cornerRadius(8)
            Text("\(episode.formattedTitle)")
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .font(.subheadline)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 122)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color(white: 0.1))
        .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 2)
        .cornerRadius(12)
        .listRowBackground(Color.clear)
    }
}

#Preview {
    EpisodeCellView(episode: ShowDetailMapper.map(show: MockedDetailData.detail).sections[0].episodes[0])
}
