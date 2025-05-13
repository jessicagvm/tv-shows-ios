//
//  LoadingPage.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 13/05/2025.
//

import SwiftUI

struct LoadingPage: View {
    var body: some View {
        ProgressView()
            .frame(maxWidth: .infinity, alignment: .center)
            .tint(.gray)
    }
}

#Preview {
    LoadingPage()
}
