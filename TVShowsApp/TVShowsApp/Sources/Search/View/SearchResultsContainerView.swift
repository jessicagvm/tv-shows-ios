//
//  SearchResultsContainerView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 14/05/2025.
//

import SwiftUI

struct SearchResultsContainerView: View {
    let results: [SearchResultViewData]
    var body: some View {
        VStack(alignment: .leading) {
            SearchSubtitleView(text: "Top Results")
            SearchResultsView(results: results)
        }
    }
}

#Preview {
    SearchResultsContainerView(results: [SearchResultViewData.init(show: ShowMapper.map(show: MockedData.shows[0]))])
}
