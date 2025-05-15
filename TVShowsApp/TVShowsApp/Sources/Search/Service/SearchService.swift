//
//  SearchService.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 14/05/2025.
//


struct SearchService: SearchServiceProtocol {
    private let network: NetworkClientProtocol
   
    init(network: NetworkClientProtocol) {
        self.network = network
    }
    
    func fetchShowsBy(name: String) async throws -> [SearchResult] {
        let endpoint = ShowEndpoint.search(query: name)
        return try await network.request(endpoint: endpoint)
    }
}
