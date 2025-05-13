//
//  APiService.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 12/05/2025.
//

import Foundation

final class NetworkClient: NetworkClientProtocol {
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func request<T>(endpoint: Endpoint) async throws -> T where T : Decodable {
        guard let urlRequest = endpoint.getURLRequest() else {
            throw NetworkError.invalidURL
        }
        
        do {
            let (data, response) = try await session.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse(statusCode: nil)
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.invalidResponse(statusCode: httpResponse.statusCode)
            }
            
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw NetworkError.decodingError
            }
            
        } catch let error as URLError {
            switch error.code {
            case .notConnectedToInternet:
                throw NetworkError.noInternet
            case .timedOut:
                throw NetworkError.timeout
            default:
                throw NetworkError.unknown
            }
        } catch {
            throw NetworkError.unknown
        }
    }
}
