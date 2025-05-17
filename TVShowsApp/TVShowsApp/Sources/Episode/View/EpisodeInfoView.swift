//
//  EpisodeInfoView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 12/05/2025.
//

import SwiftUI

struct EpisodeInfoView: View {
    let episode: EpisodeCellViewData
   
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            AsyncRemoteImage(url: episode.imageURL)
                .foregroundColor(.secondary)
                .frame(height: 160)
                .frame(maxWidth: 180)
                .clipped()
                .cornerRadius(8)
                .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 2)

            Text("\(episode.formattedTitle)")
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .font(.headline)
                .fontWeight(.medium)
                .padding(.horizontal, 8)

            Text("\(episode.summary)")
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .font(.footnote)
                .fontWeight(.regular)
        }
        .padding(.horizontal, 32)
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .background(Color.black)
    }
}

#Preview {
    EpisodeInfoView(episode: ShowDetailMapper.map(show: MockedDetailData.detail).sections[0].episodes[0])
}
