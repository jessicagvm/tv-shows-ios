//
//  MockShowDetailService.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 13/05/2025.
//
import Foundation

struct MockShowDetailService: ShowDetailServiceProtocol {
    func fetchShowDetailBy(id: Int) async throws -> ShowDetail? {
        guard let url = Bundle.main.url(forResource: "show_detail_82_episodes", withExtension: "json") else {
            return nil
        }
        
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(ShowDetail.self, from: data)
    }
}
