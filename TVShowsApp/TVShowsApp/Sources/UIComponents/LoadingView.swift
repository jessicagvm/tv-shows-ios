//
//  LoadingView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 10/05/2025.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea(.all)
            ProgressView()
                .progressViewStyle(.circular)
                .tint(.gray)
                .scaleEffect(2)
        }
    }
}

#Preview {
    LoadingView()
}
