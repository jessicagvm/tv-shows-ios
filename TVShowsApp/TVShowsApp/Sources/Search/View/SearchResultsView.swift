//
//  SearchResultsView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 14/05/2025.
//

import SwiftUI

struct SearchResultsView: View {
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())]
    let results: [SearchResultViewData]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(results) { result in
                    NavigationLink(destination: ShowDetailView.build(for: result.show)) {
                        ShowListCellView(show: result.show)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.black)
        }
    }
}

#Preview {
    SearchResultsView(results: [SearchResultViewData.init(show: ShowMapper.map(show: MockedData.shows[0]))])
}
