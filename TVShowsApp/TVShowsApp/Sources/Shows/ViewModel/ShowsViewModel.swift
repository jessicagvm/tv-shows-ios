//
//  ShowsViewModel.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 10/05/2025.
//

import Foundation

@MainActor
final class ShowsViewModel: ObservableObject {
    private let service: ShowsServiceProtocol
    private var currentPage: Int = 0
    private var isEndList: Bool = false
    let title = "TV Shows"
    @Published var shows: [Show] = []
    @Published var state: ShowsViewState
    
    enum ShowsViewState {
        case loading
        case loadingPage
        case success(shows: [Show])
        case empty(title: String, message: String?)
        case error(title: String, message: String?, action: (()->())?)
        
        var isLoadingPage: Bool {
            if case .loadingPage = self { return true }
            return false
        }
    }
    
    init(service: ShowsServiceProtocol) {
        self.service = service
        self.state = .loading
    }
    
    func isLastShowShown(_ show: Show) -> Bool {
        // TODO: - Consider migrating pagination trigger to scroll-based detection
        let isLastItem = show == self.shows.last
        let hasMoreThanTwoItems = self.shows.count > 2

        if isLastItem && hasMoreThanTwoItems {
            return true
        }
        
        return false
    }
    
    func fetchMoreShows() async {
        guard !state.isLoadingPage, !isEndList else { return }
        
        state = .loadingPage
        await fetchShows()
    }
    
    func fetchInitialShowsPage() async {
        await fetchShows()
    }
}

private extension ShowsViewModel {
    func fetchShows() async {
        do {
            let shows = try await service.fetchShows(page: currentPage)
            handleSuccess(for: shows)
        } catch {
            handleError(error)
        }
    }
    
    func handleSuccess(for fetchedShows: [Show]) {
        guard fetchedShows.isEmpty else {
            setMoreShows(for: fetchedShows)
            return
        }
        
        if self.shows.isEmpty {
            let error = NetworkError.unknown
            setErrorState(error)
        } else {
            state = .success(shows: self.shows)
        }
    }
    
    func setMoreShows(for fetchedShows: [Show]) {
        if !fetchedShows.isEmpty {
            currentPage += 1
            
            var filteredShows: [Show] = self.shows
            filteredShows.append(contentsOf: fetchedShows)
            filteredShows = filteredShows.uniqueById()
              
            self.shows = filteredShows
            state = .success(shows: self.shows)
        }
    }
    
    func retry() {
        switch state {
        case .error where shows.isEmpty:
            state = .loading
            Task { await fetchShows() }
        case .error where !shows.isEmpty:
            Task { await fetchMoreShows() }
        default:
            break
        }
    }
    
    func handleError(_ error: Error) {
        guard self.shows.isEmpty else {
            handleErrorPreservingCurrentResults(error)
            return
        }
        
        self.setErrorState(error)
    }
    
    func handleErrorPreservingCurrentResults(_ error: Error) {
        if  let error = error as? NetworkError, error.isNoFoundError {
            self.isEndList = true
        }
        
        self.state = .success(shows: self.shows)
    }
    
    func setErrorState(_ error: Error) {
        guard let error = error as? NetworkError, let description = error.description else { return }
        self.state = .error(title: "Oops! Something went wrong",
                            message: "\(description)",
                            action: error.shouldRetry ? { self.retry() } : nil)
    }
}
