//
//  SearchServiceProtocol.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 14/05/2025.
//


protocol SearchServiceProtocol {
    func fetchShowsBy(name: String) async throws -> [SearchResult]
}