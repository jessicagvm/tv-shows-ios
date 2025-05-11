//
//  ShowsView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 10/05/2025.
//

import SwiftUI

struct ShowsView: View {
    @StateObject var viewModel: ShowsViewModel = ShowsViewModel(service: MockShowsService())
    
    var body: some View {
            NavigationStack {
                ZStack {
                    List(viewModel.shows) { show in
                        ShowListCellView(show: show)
                            .onAppear {
                                if viewModel.isLastShowShown(show) {
                                    Task {
                                        await viewModel.fetchMoreShows()
                                    }
                                }
                            }
                    }
                    
                    if viewModel.isloading {
                        LoadingView()
                    }
                    if viewModel.isLoadingPage {
                        ProgressView()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .tint(.white)
                    }
                }
                .navigationTitle(viewModel.title)
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .toolbarBackground(Color.black, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar)
            }
            .task {
                await viewModel.fetchInitialShowsPage()
            }
    }
}

#Preview {
    ShowsView()
}
