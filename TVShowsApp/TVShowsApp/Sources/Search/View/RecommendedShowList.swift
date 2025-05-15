//
//  RecommendedShowList.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 14/05/2025.
//

import SwiftUI

struct RecommendedShowList: View {
    let recommendedShows: [ShowViewData]
    var body: some View {
        List(recommendedShows) { show in
            let service = ShowDetailService(network: NetworkClient(session: URLSession.shared))
            let showViewModel = ShowDetailViewModel(service: service, id: show.id)
            ZStack {
                NavigationLink(destination: ShowDetailView(viewModel: showViewModel)) {
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
    RecommendedShowList(recommendedShows: ShowMapper.map(shows: MockedData.shows))
}
