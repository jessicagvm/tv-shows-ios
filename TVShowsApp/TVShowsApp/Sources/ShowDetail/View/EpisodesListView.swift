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
                        ZStack {
                            NavigationLink(destination: EpisodeView(episode: episode)) {
                                EmptyView()
                            }
                            .opacity(0)
                            .buttonStyle(PlainButtonStyle())
                            EpisodeCellView(episode: episode)
                        }
                        .listRowBackground(Color.black)
                        .listRowSeparator(.hidden)
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
