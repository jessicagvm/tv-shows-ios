//
//  ShowsView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 10/05/2025.
//

import SwiftUI

struct ShowsView: View {
    @StateObject var viewModel: ShowsViewModel
    
    init(viewModel: ShowsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                inner
            }
            .background(Color.black)
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .navigationTitle(viewModel.title)
            .task {
                await viewModel.fetchInitialShowsPage()
            }
        }
    }
    
    @ViewBuilder
    private var inner: some View {
        switch viewModel.state {
        case .loading:
            LoadingView()
        case .loadingPage:
            LoadingPage()
        case .empty(let title, let message):
            EmptyStateView(title: title, message: message)
        case .error(let title, let message, let action):
            ErrorView(title: title, message: message, action: action)
        case .success(_):
            ShowListView(viewModel: viewModel)
        }
    }
}

#Preview {
    ShowsView(viewModel: ShowsViewModel(service: MockShowsService()))
}
