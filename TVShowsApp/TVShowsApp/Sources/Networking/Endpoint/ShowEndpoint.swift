//
//  ShowEndpoint.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 12/05/2025.
//
import Foundation

enum ShowEndpoint {
    case showList(page: String)
    case showDetail(id: Int)
    
}

extension ShowEndpoint: Endpoint {
    func getURLRequest() -> URLRequest? {
        guard var components = URLComponents(string: baseURL + path) else {
            return nil
        }
        
        components.queryItems = queryItems
        guard let url = components.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        headers?.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        return request
    }
}

private extension ShowEndpoint {
    var baseURL: String { "https://api.tvmaze.com" }
    
    var path: String {
        switch self {
        case .showList(_):
            return "/shows"
        case .showDetail(let id):
            return "/shows/\(id)"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .showList(let query):
            return [URLQueryItem(name: "page", value: query)]
        case .showDetail(_):
            return [URLQueryItem(name: "embed", value: "episodes")]
            
        }
    }
    
    var body: Data? { nil }
}
