//
//  ShowsViewData.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 16/05/2025.
//
import Foundation

struct ShowsViewData: Equatable, Hashable {
    let shows: [ShowViewData]
    let title: String
    let recommendedShow: ShowViewData
}
