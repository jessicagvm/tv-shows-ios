//
//  SearchResultMapper.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 16/05/2025.
//
import Foundation

struct SearchResultMapper {
    static func map(result: SearchResult) -> SearchResultViewData {
        SearchResultViewData(show: ShowMapper.map(show: result.show))
    }
    
    static func map(results: [SearchResult]) -> [SearchResultViewData] {
        let results: [SearchResult] = results.uniqueById()
        return results.map { SearchResultMapper.map(result: $0)}
    }
}
