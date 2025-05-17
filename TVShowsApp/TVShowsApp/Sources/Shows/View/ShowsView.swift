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
                Color.black
                    .ignoresSafeArea()
                innerView
            }
            .background(Color.black)
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .task {
                await viewModel.fetchInitialShowsPage()
            }
        }
    }
    
    @ViewBuilder
    private var innerView: some View {
        switch viewModel.state {
        case .loading, .idle:
            LoadingView()
        case .empty(let title, let message):
            EmptyStateView(title: title, message: message)
        case .error(let error):
            ErrorView(error: error)
        case .success(let viewData):
            ScrollView(showsIndicators: false) {
                VStack (spacing: 0) {
                    ShowsHeaderContainerView(viewData: viewData)
                    ShowListContainerView(viewModel: viewModel)
                }
            }
            .background(.black)
        }
    }
}

extension ShowsView {
    static func build() -> some View {
        let service = ShowsService(network: NetworkClient(session: URLSession.shared))
        let viewModel = ShowsViewModel(service: service)
        return ShowsView(viewModel: viewModel)
    }
}

#Preview {
    ShowsView(viewModel: ShowsViewModel(service: MockShowsService()))
}
