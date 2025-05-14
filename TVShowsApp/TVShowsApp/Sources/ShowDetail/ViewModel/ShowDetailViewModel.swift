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
    //TODO: - receive all Show instance
    private let id: Int
    @Published var state: ShowDetailViewState
    
    enum ShowDetailViewState {
        case loading
        case success(detail: ShowDetailViewData)
        case empty(title: String, message: String?)
        case error(title: String, message: String?, action: (()->())?)
    }
    
    init(service: ShowDetailServiceProtocol, id: Int) {
        self.service = service
        self.id = id
        state = .loading
    }
    
    func fetchDetail() async {
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
        
        if !detail.embedded.episodes.isEmpty {
            let data = ShowDetailMapper.map(show: detail)
            state = .success(detail: data)
        } else {
            state = .empty(title: "No episodes available", message:  nil)
        }
    }
    
    func handleError(_ error: Error) {
        setErrorState(error)
    }
    
    func retry() {
        state = .loading
        Task { await fetchDetail() }
    }
    
    func setErrorState(_ error: Error) {
        guard let error = error as? NetworkError, let description = error.description else { return }
        self.state = .error(title: "Something went wrong",
                            message: "\(description)",
                            action: error.shouldRetry ? { self.retry() } : nil)
    }
}
