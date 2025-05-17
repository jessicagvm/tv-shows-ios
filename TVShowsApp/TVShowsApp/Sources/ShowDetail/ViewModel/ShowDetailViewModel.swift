//
//  ShowDetailViewModel.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 11/05/2025.
//

import Foundation

@MainActor
final class ShowDetailViewModel: ObservableObject {
    private let service: ShowDetailServiceProtocol
    private let id: Int
    private var hasLoadedOnce = false
  
    @Published private(set) var state: ShowDetailViewState = .idle
    
    enum ShowDetailViewState {
        case idle
        case loading
        case success(detail: ShowDetailViewData)
        case empty(header: ShowDetailViewData, title: String, message: String?)
        case error(_ error: ErrorViewData)
    }
    
    init(service: ShowDetailServiceProtocol, id: Int) {
        self.service = service
        self.id = id
    }
    
    func fetchDetail() async {
        guard !hasLoadedOnce else { return }
        hasLoadedOnce = true
        state = .loading
        do {
            let detail = try await service.fetchShowDetailBy(id: self.id)
            handleSuccess(for: detail)
        } catch {
            handleError(error)
        }
    }
}

private extension ShowDetailViewModel {
    func handleSuccess(for detail: ShowDetail?) {
        guard let detail = detail else {
            let error = NetworkError.invalidData
            setErrorState(error)
            return
        }
        
        let data = ShowDetailMapper.map(show: detail)
        if !detail.embedded.episodes.isEmpty {
            state = .success(detail: data)
        } else {
            state = .empty(header: data, title: "No episodes available", message:  nil)
        }
    }
    
    func handleError(_ error: Error) {
        setErrorState(error)
    }
    
    func retry() {
        Task { await fetchDetail() }
    }
    
    func setErrorState(_ error: Error) {
        guard let error = error as? NetworkError, let description = error.description else { return }
        let errorViewData = ErrorViewData(title: "Something went wrong",
                            message: "\(description)",
                            action: error.shouldRetry ? { self.retry() } : nil)
        self.state = .error(errorViewData)
    }
}
