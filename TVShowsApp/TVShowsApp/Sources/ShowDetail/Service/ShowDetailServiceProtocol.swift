//
//  ShowDetailServiceProtocol.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 13/05/2025.
//


protocol ShowDetailServiceProtocol {
    func fetchShowDetailBy(id: Int) async throws -> ShowDetail?
}
