//
//  ShowListContainerView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 14/05/2025.
//

import SwiftUI

struct ShowListContainerView: View {
    @ObservedObject var viewModel: ShowsViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SearchSubtitleView(text: viewModel.titleList)
            ShowListView(viewModel: viewModel)
        }
    }
}

#Preview {
    ShowListContainerView(viewModel: ShowsViewModel(service: MockShowsService()))
}
