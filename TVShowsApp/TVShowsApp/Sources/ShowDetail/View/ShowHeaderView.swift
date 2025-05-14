//
//  ShowHeaderView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 11/05/2025.
//

import SwiftUI

struct ShowHeaderView: View {
    let detail: ShowDetailViewData
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            AsyncRemoteImage(url: detail.imageURL)
                .foregroundColor(.secondary)
                .frame(height: 120)
                .frame(maxWidth: 100)
                .clipped()
                .cornerRadius(8)
                .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 2)
            
            Text("\(detail.name)")
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .font(.headline)
                .fontWeight(.medium)
                .padding(.horizontal, 8)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 192)
        .background(.black)
        .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    ShowHeaderView(detail: ShowDetailMapper.map(show: MockedDetailData.detail))
}
