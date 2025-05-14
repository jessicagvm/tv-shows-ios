//
//  EpisodeCellView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 11/05/2025.
//

import SwiftUI

struct EpisodeCellView: View {
    let episode: ShowDetail.Episode
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.secondary)
                .frame(width: 50, height: 90)
                .clipped()
                .cornerRadius(8)
            
            // FIXME:- should handle a title for this view
            Text("\(episode.number). \(episode.name)")
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
        .cornerRadius(12)
        .background(Color(white: 0.1))
        .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 2)
        .listRowBackground(Color.clear)
    }
}

#Preview {
    EpisodeCellView(episode: MockedDetailData.detail.embedded.episodes[0])
}
