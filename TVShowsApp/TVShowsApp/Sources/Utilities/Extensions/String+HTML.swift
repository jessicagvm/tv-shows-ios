//
//  String+HTML.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 14/05/2025.
//

import Foundation

extension String {
    var strippedHTML: String {
        self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
