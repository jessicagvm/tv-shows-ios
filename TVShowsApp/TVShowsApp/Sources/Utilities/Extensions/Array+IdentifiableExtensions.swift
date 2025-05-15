//
//  Array+IdentifiableExtensions.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 15/05/2025.
//
import Foundation

extension Array where Element: Identifiable {
    func uniqueById() -> [Element] {
        reduce(into: [Element.ID: Element]()) { result, element in
            result[element.id] = element
        }
        .map { $0.value }
    }
}
