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
            ShowListCellView(show: show)
                .onAppear {
                    if viewModel.isLastShowShown(show) {
                        Task {
                            await viewModel.fetchMoreShows()
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
    ShowListView(viewModel: ShowsViewModel(service: MockShowsService()))
}
