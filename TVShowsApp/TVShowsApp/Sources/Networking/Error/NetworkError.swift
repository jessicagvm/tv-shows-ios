//
//  NetworkError.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 13/05/2025.
//

import Foundation

enum NetworkError: Error {
    case noInternet
    case timeout
    case invalidURL
    case invalidResponse(statusCode: Int?)
    case invalidData
    case decodingError
    case unknown
}

extension NetworkError: LocalizedError, Equatable {
    var description: String? {
        switch self {
        case .noInternet:
            return "You're offline. Please check your internet connection."
        case .timeout:
            return "The request took too long. Try again."
        case .invalidResponse:
            return "The server returned an unexpected response."
        case .invalidData:
            return "The data received is corrupted."
        case .decodingError:
            return "it couldn't process the information received."
        case .unknown:
            return "Please try again."
        case .invalidURL:
            return "the url is invalid"
        }
    }
    
    var shouldRetry: Bool {
        switch self {
        case .noInternet, .unknown, .timeout:
            return true
        case .invalidResponse(let statusCode):
            guard statusCode == 500 else { return false }
            return true
        default:
            return false
        }
    }
    
    var isNoFoundError: Bool {
        switch self {
        case .invalidResponse(let statusCode):
            guard statusCode == 400 else { return false }
            return true
        default:
            return false
        }
    }
}
