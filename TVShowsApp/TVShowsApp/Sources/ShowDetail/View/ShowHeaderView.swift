//
//  ShowHeaderView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 11/05/2025.
//

import SwiftUI

struct ShowHeaderView: View {
    let detail: ShowDetail
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.secondary)
                .frame(height: 120)
                .frame(maxWidth: .infinity)
                .clipped()
            
            Text("\(detail.name)")
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .font(.headline)
                .fontWeight(.medium)
                .padding(.horizontal, 8)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 192)
        .background(Color(white: 0.1))
        .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    ShowHeaderView(detail: MockedDetailData.detail)
}
