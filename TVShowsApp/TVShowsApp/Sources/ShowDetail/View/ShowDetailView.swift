//
//  ShowDetailView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 11/05/2025.
//

import SwiftUI

struct ShowDetailView: View {
    @StateObject var viewModel: ShowDetailViewModel
    
    init(viewModel: ShowDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                innerView
                    .padding(.top)
            }.task {
                await viewModel.fetchDetail()
            }
            .background(Color.black)
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
    
    @ViewBuilder
    private var innerView: some View {
        switch viewModel.state {
        case .idle, .loading:
            LoadingView()
        case .empty(let header, let title, let message):
            ShowDetailEmptyStateView(header: header, title: title, message: message)
        case .error(let error):
            ErrorView(error: error)
        case .success(let detail):
            VStack(alignment: .leading, spacing: 0) {
                ShowContainerView(detail: detail)
                EpisodesListView(detail: detail)
            }
        }
    }
}

extension ShowDetailView {
    static func build(for show: ShowViewData) -> some View {
        let service = ShowDetailService(network: NetworkClient(session: URLSession.shared))
        let showViewModel = ShowDetailViewModel(service: service, id: show.id)
        return ShowDetailView(viewModel: showViewModel)
    }
}

#Preview {
    ShowDetailView(viewModel: ShowDetailViewModel(service: MockShowDetailService(), id: 82))
}
