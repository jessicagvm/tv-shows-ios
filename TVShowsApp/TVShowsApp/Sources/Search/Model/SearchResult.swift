//
//  SearchResult.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 14/05/2025.
//

import Foundation

struct SearchResult: Equatable, Decodable, Identifiable {
    let show: Show
    var id: Int { show.id }
}
