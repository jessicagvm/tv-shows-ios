//
//  RecommendedShowListView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 14/05/2025.
//

import SwiftUI

struct RecommendedShowListView: View {
    let recommendedShows: [ShowViewData]
    var body: some View {
        List(recommendedShows) { show in
            ZStack {
                NavigationLink(destination: ShowDetailView.build(for: show)) {
                    EmptyView()
                }
                .opacity(0)
                .buttonStyle(PlainButtonStyle())
                
                RecommendedShowListCellView(show: show)
            }
            .listRowBackground(Color.black)
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.black)
    }
}

#Preview {
    RecommendedShowListView(recommendedShows: ShowMapper.map(shows: MockedData.shows))
}
