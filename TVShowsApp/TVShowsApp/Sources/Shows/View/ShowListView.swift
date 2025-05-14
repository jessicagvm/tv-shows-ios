//
//  ShowListView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 13/05/2025.
//

import SwiftUI

struct ShowListView: View {
    @ObservedObject var viewModel: ShowsViewModel
    
    var body: some View {
        List(viewModel.shows) { show in
            let service = ShowDetailService(network: NetworkClient(session: URLSession.shared))
            let ShowViewModel = ShowDetailViewModel(service: service, id: show.id)
            ZStack {
                NavigationLink(destination: ShowDetailView(viewModel: ShowViewModel)) {
                    EmptyView()
                }
                .opacity(0)
                .buttonStyle(PlainButtonStyle())
                
                ShowListCellView(show: show)
                    .onAppear {
                        if viewModel.isLastShowShown(show) {
                            Task {
                                await viewModel.fetchMoreShows()
                            }
                        }
                    }
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
    ShowListView(viewModel: ShowsViewModel(service: MockShowsService()))
}
