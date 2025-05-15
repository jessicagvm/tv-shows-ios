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
        if show.id == self.shows.last?.id {
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
    
    func handleSuccess(for shows: [Show]) {
        if shows.isEmpty {
            state = .empty(title: "No shows found", message: nil)
        } else {
            currentPage += 1
            // TODO: -  check repetition of items
            self.shows.append(contentsOf: shows)
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
        switch error as? NetworkError {
        case .invalidResponse(let statusCode):
            if statusCode == 404 {
                self.isEndList = true
            } else {
                self.setErrorState(error)
            }
        default:
            self.setErrorState(error)
        }
    }
    
    func setErrorState(_ error: Error) {
        guard let error = error as? NetworkError, let description = error.description else { return }
        self.state = .error(title: "Something went wrong",
                            message: "\(description)",
                            action: error.shouldRetry ? { self.retry() } : nil)
    }
}
