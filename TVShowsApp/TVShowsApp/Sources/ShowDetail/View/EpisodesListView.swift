//
//  EpisodesListView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 13/05/2025.
//

import SwiftUI

struct EpisodesListView: View {
    let detail: ShowDetailViewData
    
    var body: some View {
        List {
            ForEach(detail.sections) { section in
                Section(header: EpisodesSectionView(title: section.title)) {
                    ForEach(section.episodes) { episode in
                        EpisodeCellView(episode: episode)
                    }
                }
                
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.black)
    }
}

#Preview {
    EpisodesListView(detail: ShowDetailMapper.map(show: MockedDetailData.detail))
}
