//
//  NetworkClientProtocol.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 13/05/2025.
//


protocol NetworkClientProtocol {
    func request<T: Decodable>(endpoint: Endpoint) async throws -> T
}

