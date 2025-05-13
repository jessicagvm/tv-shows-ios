//
//  ShowsService.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 13/05/2025.
//

import Foundation

struct ShowsService: ShowsServiceProtocol {
    private let network: NetworkClientProtocol
    
    init(network: NetworkClientProtocol) {
        self.network = network
    }
    
    func fetchShows(page: Int) async throws -> [Show] {
        let endpoint = ShowEndpoint.showList(page: "\(page)")
        return try await network.request(endpoint: endpoint)
    }
}
