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
                SectionContainerView(section: section)
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.black)
    }
}

private struct SectionContainerView: View {
    let section: SeasonSection
    
    var body: some View {
        Section(header: EpisodesSectionView(title: section.title)) {
            ForEach(section.episodes) { episode in
                EpisodeRow(episode: episode)
                    .listRowBackground(Color.black)
                    .listRowSeparator(.hidden)
            }
        }
    }
}

private struct EpisodeRow: View {
    let episode: EpisodeCellViewData
    var body: some View {
        ZStack {
            NavigationLink(destination: EpisodeView(episode: episode)) {
                EmptyView()
            }
            .opacity(0)
            .buttonStyle(PlainButtonStyle())
            EpisodeCellView(episode: episode)
                .listRowBackground(Color.clear)
        }
    }
}

#Preview {
    EpisodesListView(detail: ShowDetailMapper.map(show: MockedDetailData.detail))
}
