//
//  MockSearchService.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 14/05/2025.
//

import Foundation

struct MockSearchService: SearchServiceProtocol {
    func fetchShowsBy(name: String) async throws -> [SearchResult] {
        guard let showsUrl = Bundle.main.url(forResource: "search_shows_q_girls", withExtension: "json") else {
            return []
        }
        
        let data = try Data(contentsOf: showsUrl)
        return try JSONDecoder().decode([SearchResult].self, from: data)
    }
}
