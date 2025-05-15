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
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isSearchFocused = true
                }
            }
        }
    }
    
    @ViewBuilder
    private var innerView: some View {
        switch viewModel.state {
        case .initial(let recommended):
            let values = viewModel.getRecommededShows(for: recommended)
            RecommendedShowsContainerView(recommendedShows: values)
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

#Preview {
    SearchView(viewModel: SearchViewModel(service: MockSearchService(), recommededShows: MockedData.shows))
}
