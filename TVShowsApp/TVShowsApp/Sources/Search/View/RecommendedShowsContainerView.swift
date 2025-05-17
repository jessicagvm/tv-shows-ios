//
//  RecommendedShowsContainerView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 14/05/2025.
//

import SwiftUI

struct RecommendedShowsContainerView: View {
    let recommendedShows: [ShowViewData]
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            SearchSubtitleView(text: "Recommended TV Shows")
            RecommendedShowListView(recommendedShows: recommendedShows)
        }
    }
}

#Preview {
    RecommendedShowsContainerView(recommendedShows: ShowMapper.map(shows: MockedData.shows))
}
