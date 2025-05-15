//
//  ShowDetailMapper.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 14/05/2025.
//
import Foundation

struct ShowDetailMapper {
    private static func getSchedule(for show: ShowDetail) -> String {
        let days = show.schedule.days
        guard !show.schedule.days.isEmpty else {
            return "No schedule available"
        }
        return "Schedule: \(days.joined(separator: ", ")) at \(show.schedule.time)"
    }
    
    private static func getSections(for show: ShowDetail) -> [SeasonSection] {
        let episodes: [ShowDetail.Episode] = show.embedded.episodes.uniqueById()
        let grouped = Dictionary(grouping: episodes) { $0.season }
        
        let sections = grouped.map { (season, episodes) in
            let cells = episodes.sorted(by: { $0.number < $1.number })
                .map {
                    EpisodeCellViewData(
                        id: $0.id,
                        title: $0.name,
                        subtitle: "S\($0.season):E\($0.number)",
                        summary: $0.summary?.strippedHTML ?? "No summary available",
                        imageURL: URL(string: $0.image?.medium ?? ""), 
                        formattedTitle: "S\($0.season):E\($0.number) \($0.name)"
                    )
                }
            
            return SeasonSection(
                id: season,
                title: "Season \(season)",
                episodes: cells
            )
        }.sorted(by: { $0.id < $1.id })
        return sections
    }
    
    static func map(show: ShowDetail) -> ShowDetailViewData {
        let genres = show.genres.isEmpty ? "No genres" : "Genres: \(show.genres.joined(separator: ", "))"
        let schedule: String = getSchedule(for: show)
        let sections = getSections(for: show)
        
        return ShowDetailViewData(
            name: show.name,
            summary: show.summary?.strippedHTML ?? "No summary available.",
            imageURL: URL(string: show.image?.medium ?? ""),
            genres: genres,
            schedule: schedule,
            sections: sections
        )
    }
}
