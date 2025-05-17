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
        let shows: [Show] = shows.uniqueById()
        return shows.map { ShowMapper.map(show: $0) }
    }
    
    static func mapAvailableShows(_ shows: [Show]) -> ShowsViewData? {
        let mappedShows = ShowMapper.map(shows: shows)
        guard let last = mappedShows.last else {
            return nil
        }
       
        return ShowsViewData(shows: mappedShows, title: "For You", recommendedShow: last)
    }
}
