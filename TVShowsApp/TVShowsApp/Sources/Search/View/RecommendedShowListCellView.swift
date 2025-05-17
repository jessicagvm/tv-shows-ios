//
//  RecommendedShowListCellView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 14/05/2025.
//

import SwiftUI

struct RecommendedShowListCellView: View {
    let show: ShowViewData
    
    var body: some View {
        HStack(spacing: 12) {
            Spacer()
            AsyncRemoteImage(url: show.imageURL)
                .foregroundColor(.secondary)
                .frame(height: 120)
                .frame(maxWidth: 100)
                .clipped()
                .cornerRadius(8)
            Text("\(show.name)")
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .font(.subheadline)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 122)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(.clear)
        .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 2)
        .cornerRadius(12)
        .listRowBackground(Color.clear)
    }
}

#Preview {
    RecommendedShowListCellView(show: ShowMapper.map(show: MockedData.shows[0]))
}
