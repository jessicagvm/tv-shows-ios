//
//  SearchResultViewData.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 16/05/2025.
//


struct SearchResultViewData: Equatable, Identifiable {
    let show: ShowViewData
    var id: Int { show.id }
}