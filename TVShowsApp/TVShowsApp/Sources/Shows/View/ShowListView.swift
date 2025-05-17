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
        LazyVStack(spacing: 16) {
            ForEach(viewModel.showsListViewData) { show in
                ShowRow(show: show) {
                    viewModel.handlePaginationIfNeeded(show)
                }
            }
            .background(Color.black)
            
            if viewModel.isPaginating {
                LoadingPage()
            }
        }
        .padding(.horizontal, 16)
        .background(Color.black)
    }
}

private struct ShowRow: View {
    let show: ShowViewData
    let perform: () -> Void
    
    var body: some View {
        NavigationLink(destination: ShowDetailView.build(for: show)) {
            ShowListCellView(show: show)
        }
        .onAppear(perform: perform)
    }
}

#Preview {
    ShowListView(viewModel: ShowsViewModel(service: MockShowsService()))
}
