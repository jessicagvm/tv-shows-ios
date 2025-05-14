//
//  EpisodesListView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 13/05/2025.
//

import SwiftUI

struct EpisodesListView: View {
    let detail: ShowDetail
    
    var body: some View {
        //FIXME: - render by season
        List(detail.embedded.episodes) { episode in
            EpisodeCellView(episode: episode)
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.black)
    }
}

#Preview {
    EpisodesListView(detail: MockedDetailData.detail)
}
