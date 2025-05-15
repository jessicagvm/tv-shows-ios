//
//  SearchResultsView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 14/05/2025.
//

import SwiftUI

struct SearchResultsView: View {
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())]
    let results: [SearchResult]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(results) { result in
                    let service = ShowDetailService(network: NetworkClient(session: URLSession.shared))
                    let showViewModel = ShowDetailViewModel(service: service, id: result.show.id)
                    ZStack {
                        NavigationLink(destination: ShowDetailView(viewModel: showViewModel)) {
                            ShowListCellView(show: result.show)
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.black)
        }
    }
}

#Preview {
    SearchResultsView(results: [SearchResult.init(show: MockedData.shows[0])])
}
