//
//  ShowViewData.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 14/05/2025.
//
import Foundation

struct ShowViewData: Equatable, Hashable, Identifiable {
    let id: Int
    let name: String
    let imageURL: URL?
}

