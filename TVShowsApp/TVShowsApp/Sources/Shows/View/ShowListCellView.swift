//
//  ShowListCellView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 10/05/2025.
//

import SwiftUI

struct ShowListCellView: View {
    let show: ShowViewData
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            ShowImageView(imageURL: show.imageURL)
            ShowTitleView(name: show.name)
        }
        .frame(height: 192)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color(white: 0.1))
        .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 2)
        .cornerRadius(12)
        .listRowBackground(Color.clear)
    }
}

#Preview {
    ShowListCellView(show: ShowMapper.map(show: MockedData.shows[0]))
}
