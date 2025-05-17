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
    private var hasLoadedOnce = false
    private var shows: [Show] = []
    let titleList = "TV Shows & Movies"
    
    @Published private(set) var state: ShowsViewState = .idle
    @Published private(set) var isPaginating: Bool = false
    @Published private(set) var showsListViewData: [ShowViewData] = []
    
    enum ShowsViewState {
        case idle
        case loading
        case success(shows: ShowsViewData)
        case empty(title: String, message: String)
        case error(_ error: ErrorViewData)
    }
    
    init(service: ShowsServiceProtocol) {
        self.service = service
    }
    
    private func isLastShowShown(_ show: ShowViewData) -> Bool {
        // TODO: - Consider migrating pagination trigger to scroll-based detection
        let isLastItem = show == self.showsListViewData.last
        let hasMoreThanTwoItems = self.shows.count > 2
        
        if isLastItem && hasMoreThanTwoItems {
            return true
        }
        
        return false
    }
    
    func handlePaginationIfNeeded(_ show: ShowViewData) {
        if isLastShowShown(show) {
            Task {
                await fetchMoreShows()
            }
        }
    }
    
    func fetchInitialShowsPage() async {
        guard !hasLoadedOnce else { return }
        hasLoadedOnce = true
        await fetchShows()
    }
}

private extension ShowsViewModel {
    func fetchMoreShows() async {
        guard !isPaginating, !isEndList else { return }
        isPaginating = true
        await fetchShows()
        isPaginating = false
    }
    
    func fetchShows() async {
        do {
            let shows = try await service.fetchShows(page: currentPage)
            handleSuccess(for: shows)
        } catch {
            handleError(error)
        }
    }
}

private extension ShowsViewModel {
    func handleSuccess(for fetchedShows: [Show]) {
        guard fetchedShows.isEmpty else {
            setMoreShows(for: fetchedShows)
            return
        }
        
        if self.shows.isEmpty {
            let error = NetworkError.unknown
            setErrorState(error)
        }
    }
    
    func setMoreShows(for fetchedShows: [Show]) {
        if !fetchedShows.isEmpty {
            currentPage += 1
            
            var filteredShows: [Show] = self.shows
            filteredShows.append(contentsOf: fetchedShows)
            filteredShows = filteredShows.uniqueById()
            
            self.shows = filteredShows
            
            guard let showsViewData = ShowMapper.mapAvailableShows(shows) else { return }
            
            self.showsListViewData = showsViewData.shows
            
            guard !isPaginating else { return }
            state = .success(shows: showsViewData)
        }
    }
}

private extension ShowsViewModel {
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
    }
    
    func setErrorState(_ error: Error) {
        guard let error = error as? NetworkError, let description = error.description else { return }
        let errorViewData = ErrorViewData(title: "Oops! Something went wrong",
                                          message: "\(description)",
                                          action: error.shouldRetry ? { self.retry() } : nil)
        self.state = .error(errorViewData)
    }
}
