//
//  EpisodesSectionView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 14/05/2025.
//

import SwiftUI

struct EpisodesSectionView: View {
    let title: String
    var body: some View {
        HStack {
            Text("\(title)")
                .foregroundColor(.gray)
                .font(.subheadline)
                .fontWeight(.medium)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .background(.clear)
        .padding(.horizontal, 8)
    }
}

#Preview {
    EpisodesSectionView(title: "season 1")
}
