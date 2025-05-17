//
//  RecommendedShowView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 15/05/2025.
//

import SwiftUI

struct RecommendedShowView: View {
    let show: ShowViewData
    var body: some View {
        NavigationLink(destination: ShowDetailView.build(for: show)) {
            ShowHeaderView(imageURL: show.imageURL, name: show.name)
        }
    }
}

#Preview {
    RecommendedShowView(show: ShowMapper.map(show: MockedData.shows[0]))
}
