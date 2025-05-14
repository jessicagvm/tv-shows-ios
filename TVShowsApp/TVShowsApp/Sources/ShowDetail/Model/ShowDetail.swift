//
//  ShowDetail.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 11/05/2025.
//

import Foundation

struct ShowDetail: Identifiable, Decodable {
    let id: Int
    let name: String
    let image: ShowImage?
    let genres: [String]
    let summary: String?
    let embedded: Embedded
    let schedule: Schedule
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case genres
        case summary
        case embedded = "_embedded"
        case schedule
    }
    
    struct Schedule: Decodable {
        let time: String
        let days: [String]
    }
    
    struct ShowImage: Decodable {
        let medium: String?
        let original: String?
    }
    
    struct Embedded: Decodable {
        let episodes: [Episode]
    }
    
    struct Episode: Identifiable, Decodable {
        let id: Int
        let name: String
        let image: ShowImage?
        let season: Int
        let number: Int
        let summary: String?
    }
}

struct MockedDetailData {
    static let detail: ShowDetail = ShowDetail(id: 82,
                                               name: "Game of Thrones",
                                               image:.init(medium: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg",
                                                           original: "https://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg"),
                                               genres: ["Drama",
                                                        "Adventure",
                                                        "Fantasy"],
                                               summary: "<p>Lord Eddard Stark, ruler of the North, is summoned to court by his old friend, King Robert Baratheon, to serve as the King's Hand. Eddard reluctantly agrees after learning of a possible threat to the King's life. Eddard's bastard son Jon Snow must make a painful decision about his own future, while in the distant east Viserys Targaryen plots to reclaim his father's throne, usurped by Robert, by selling his sister in marriage.</p>",
                                               embedded: .init(episodes: [ShowDetail.Episode(id: 1,
                                                                                             name: "Ghost",
                                                                                             image: .init(medium: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg",
                                                                                                          original: "https://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg"),
                                                                                             season: 1,
                                                                                             number: 1,
                                                                                             summary: "<p>Lord Eddard Stark, ruler of the North, is summoned to court by his old friend, King Robert Baratheon, to serve as the King's Hand. Eddard reluctantly agrees after learning of a possible threat to the King's life. Eddard's bastard son Jon Snow must make a painful decision about his own future, while in the distant east Viserys Targaryen plots to reclaim his father's throne, usurped by Robert, by selling his sister in marriage.</p>")]),
                                               schedule: .init(time: "21:00",
                                                               days: ["Sunday"]))
    
}
