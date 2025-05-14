//
//  ShowListCellView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 10/05/2025.
//

import SwiftUI

struct ShowListCellView: View {
    let show: Show
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.secondary)
                .frame(height: 120)
                .frame(maxWidth: .infinity)
                .clipped()
                .cornerRadius(8)
            
            Text("\(show.name)")
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .font(.headline)
                .fontWeight(.medium)
                .padding(.horizontal, 8)
        }
        .frame(height: 192)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .cornerRadius(12)
        .background(Color(white: 0.1))
        .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 2)
        .listRowBackground(Color.clear)
    }
}

#Preview {
    ShowListCellView(show: MockedData.shows[0])
}
