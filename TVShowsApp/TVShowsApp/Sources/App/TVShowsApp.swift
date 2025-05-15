//
//  TVShowsApp.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 10/05/2025.
//

import SwiftUI

@main
struct TVShowsApp: App {
    var body: some Scene {
        WindowGroup {
            ShowsView(viewModel: ShowsViewModel(service: ShowsService(network: NetworkClient(session: URLSession.shared))))
        }
    }
}
