//
//  SearchView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 12/05/2025.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel
    @FocusState private var isSearchFocused: Bool
    
    init(viewModel: SearchViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchBarView(text: $viewModel.searchText, placeholder: viewModel.placeholder)
                innerView
                    .padding(.top)
            }
            .padding()
            .background(Color.black.ignoresSafeArea())
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .ignoresSafeArea(.keyboard)
            .focused($isSearchFocused)
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .task {
                await delayFocus()
            }
        }
    }
    
    private func delayFocus() async {
        do {
            try await Task.sleep(nanoseconds: 500_000_000)
            isSearchFocused = true
        } catch {
            print("Cancelled")
        }
    }
    
    @ViewBuilder
    private var innerView: some View {
        switch viewModel.state {
        case .initial(let recommended):
            RecommendedShowsContainerView(recommendedShows: recommended)
        case .loading:
            LoadingView()
        case .empty(let title):
            EmptyStateView(title: title, message: nil)
        case .error:
            LoadingView()
        case .success(let results):
            SearchResultsContainerView(results: results)
        }
    }
}

extension SearchView {
    static func build(for shows: [ShowViewData]) -> some View {
        let service = SearchService(network: NetworkClient(session: URLSession.shared))
        let viewModel = SearchViewModel(service: service, recommededShows: shows)
        return SearchView(viewModel: viewModel)
    }
}

#Preview {
    SearchView(viewModel: SearchViewModel(service: MockSearchService(), recommededShows: ShowMapper.map(shows: MockedData.shows)))
}
