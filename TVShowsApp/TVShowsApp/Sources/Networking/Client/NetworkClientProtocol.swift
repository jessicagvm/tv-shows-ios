//
//  NetworkClientProtocol.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 13/05/2025.
//
import Foundation

protocol NetworkClientProtocol {
    func request<T: Decodable>(endpoint: Endpoint) async throws -> T
    func download(from url: URL) async throws -> Data
}
