//
//  ShowDetailService.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 13/05/2025.
//


struct ShowDetailService: ShowDetailServiceProtocol {
    private let network: NetworkClientProtocol
    
    init(network: NetworkClientProtocol) {
        self.network = network
    }
    
    func fetchShowDetailBy(id: Int) async throws -> ShowDetail? {
        let endpoint = ShowEndpoint.showDetail(id: id)
        return try await network.request(endpoint: endpoint)
    }
}
