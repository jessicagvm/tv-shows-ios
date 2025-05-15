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
        VStack(alignment: .leading) {
            HStack {
                Text(viewModel.title)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                
                let view = SearchView(viewModel: SearchViewModel(service: SearchService(network: NetworkClient(session: URLSession.shared)), recommededShows: viewModel.shows))
                
                NavigationLink(destination: view) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 28, weight: .light))
                        .foregroundColor(.white)
                        .padding(8)
                }
            }.padding(.horizontal, 24)
            ShowListView(viewModel: viewModel)
        }
    }
}

#Preview {
    ShowListContainerView(viewModel: ShowsViewModel(service: MockShowsService()))
}
