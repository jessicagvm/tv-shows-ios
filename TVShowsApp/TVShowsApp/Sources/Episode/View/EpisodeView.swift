//
//  EpisodeView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 12/05/2025.
//

import SwiftUI

struct EpisodeView: View { 
    let episode: EpisodeCellViewData
    
    var body: some View {
        NavigationStack {
            EpisodeInfoView(episode: episode)
                .background(Color.black)
                .toolbarBackground(Color.black, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

#Preview {
    EpisodeView(episode: ShowDetailMapper.map(show: MockedDetailData.detail).sections[0].episodes[0])
}
