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
    
    @Published var title = "TV Shows"
    @Published var shows: [Show] = []
    @Published var isloading: Bool = false
    @Published var isLoadingPage: Bool = false
    
    init(service: ShowsServiceProtocol) {
        self.service = service
    }
    
    func isLastShowShown(_ show: Show) -> Bool {
        if show.id == self.shows.last?.id {
            return true
        }
        
        return false
    }
    
    func fetchMoreShows() async {
        guard !isLoadingPage, !isEndList else { return }
        
        isLoadingPage = true
        await fetchShows()
        isLoadingPage = false
    }
    
    func fetchInitialShowsPage() async {
        isloading = true
        await fetchShows()
        isloading = false
    }
}

private extension ShowsViewModel {
    func fetchShows() async {
        do {
            let shows = try await service.fetchShows(page: currentPage)
            
            if shows.isEmpty {
                // FIXME: - empty state view
            } else {
                currentPage += 1
                // TODO: -  check repetition of items
                self.shows.append(contentsOf: shows)
            }
        } catch {
            // FIXME: - handle error
            print("Error: \(error.localizedDescription)")
            if let error = error as? HTTPURLResponse, error.statusCode == 404 {
                isEndList = true
            }
        }
    }
}
