//
//  ShowMapper.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 14/05/2025.
//
import Foundation

struct ShowMapper {
    static func map(show: Show) -> ShowViewData {
        return ShowViewData(
            id: show.id,
            name: show.name,
            imageURL: URL(string: show.image?.medium ?? "")
        )
    }
    
    static func map(shows: [Show]) -> [ShowViewData] {
        return shows.map { ShowMapper.map(show:$0) }
    }
}
