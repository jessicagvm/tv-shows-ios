//
//  Show.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 11/05/2025.
//

import Foundation

struct Show: Hashable, Identifiable, Decodable {
    let id: Int
    let name: String
    let image: ShowImage?
    
    struct ShowImage: Hashable, Decodable {
        let medium: String?
        let original: String?
    }
}

struct MockedData {
    static let shows: [Show] = [Show(id: 0,
                                     name: "Ghost",
                                     image: .init(medium: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg",
                                                  original: "https://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg")
                                    ),
                                Show(id: 1,
                                     name: "Ghost",
                                     image: .init(medium: "https://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg",
                                                  original: "https://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg")
                                    )
                                
    ]
}
