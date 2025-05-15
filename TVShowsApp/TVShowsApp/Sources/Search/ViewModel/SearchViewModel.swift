//
//  SearchViewModel.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 12/05/2025.
//

import Foundation
import Combine

@MainActor
final class SearchViewModel: ObservableObject {
    private let service: SearchServiceProtocol
    private let recommededShows: [Show]
    private var cancellables = Set<AnyCancellable>()
    let placeholder = "Search shows by name..."
    
    @Published var searchText: String = ""
    @Published var state: SearchViewState
    
    enum SearchViewState {
        case initial(recommededShows: [Show])
        case loading
        case success(results: [SearchResult])
        case empty(title: String)
        case error
    }
    
    init(service: SearchServiceProtocol, recommededShows: [Show]) {
        self.service = service
        self.recommededShows = recommededShows
        self.state = .initial(recommededShows: recommededShows)
        
        $searchText
            .debounce(for: .milliseconds(400), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                Task { await self?.searchShowsBy(name: text) }
            }
            .store(in: &cancellables)
    }
    
    func getRecommededShows(for shows: [Show]) -> [ShowViewData] {
        return shows.map { ShowMapper.map(show:$0) }
    }
}
private extension SearchViewModel {
    func searchShowsBy(name: String) async {
        guard !name.isEmpty else {
            state = .initial(recommededShows: recommededShows)
            return
        }
        
        state = .loading
        do {
            let results = try await service.fetchShowsBy(name: name)
            handleSuccess(for: results)
        } catch {
            handleError(error)
        }
    }
    
    func handleSuccess(for results: [SearchResult]) {
        if results.isEmpty {
            state = .empty(title: "No results found.")
        } else {
            state = .success(results: results)
        }
    }
    
    func handleError(_ error: Error) {
        state = .error
        print("Error: \(error.localizedDescription)")
    }
}
