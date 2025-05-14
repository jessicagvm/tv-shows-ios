//
//  ShowsServiceProtocol.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 13/05/2025.
//


protocol ShowsServiceProtocol {
    func fetchShows(page: Int) async throws -> [Show]
}