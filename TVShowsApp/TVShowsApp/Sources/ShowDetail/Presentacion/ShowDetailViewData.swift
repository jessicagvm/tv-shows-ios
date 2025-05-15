//
//  ShowDetailViewData.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 14/05/2025.
//
import Foundation

struct EpisodeCellViewData: Identifiable {
    let id: Int
    let title: String
    let subtitle: String
    let summary: String
    let imageURL: URL?
    let formattedTitle: String
}

struct SeasonSection: Identifiable {
    let id: Int
    let title: String
    let episodes: [EpisodeCellViewData]
}

struct ShowDetailViewData {
    let name: String
    let summary: String
    let imageURL: URL?
    let genres: String
    let schedule: String
    let sections: [SeasonSection]
}
