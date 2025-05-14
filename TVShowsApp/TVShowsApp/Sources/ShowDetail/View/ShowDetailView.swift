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
        case .loading:
            LoadingView()
        case .empty(let title, let message):
            //TODO: - add ShowContainerView
            EmptyStateView(title: title, message: message)
        case .error(let title, let message, let action):
            ErrorView(title: title, message: message, action: action)
        case .success(let detail):
            VStack(alignment: .leading, spacing: 0) {
                ShowContainerView(detail: detail)
                EpisodesListView(detail: detail)
            }
        }
    }
}

#Preview {
    ShowDetailView(viewModel: ShowDetailViewModel(service: MockShowDetailService(), id: 82))
}
