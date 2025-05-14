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
        VStack{
            Text("\(title)")
                .foregroundColor(.white)
                .font(.subheadline)
                .fontWeight(.medium)
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .background(Color(white: 0.1))
    }
}

#Preview {
    EpisodesSectionView(title: "season 1")
}
