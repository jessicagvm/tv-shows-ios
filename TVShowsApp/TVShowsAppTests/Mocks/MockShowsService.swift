//
//  MockShowsService.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 11/05/2025.
//

import Foundation

struct MockShowsService: ShowsServiceProtocol {
    func fetchShows(page: Int) async throws -> [Show] {
        guard let showsUrl = Bundle.main.url(forResource: "shows_page_0", withExtension: "json") else {
            //TODO: - review logic
            return []
        }
        
        let data = try Data(contentsOf: showsUrl)
        return try JSONDecoder().decode([Show].self, from: data)
    }
}
