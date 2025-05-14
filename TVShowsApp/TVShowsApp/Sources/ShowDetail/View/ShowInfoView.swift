//
//  ShowInfoView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 11/05/2025.
//

import SwiftUI

struct ShowInfoView: View {
    let detail: ShowDetailViewData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Spacer()
            Text("\(detail.summary)")
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .font(.footnote)
                .fontWeight(.regular)
            
            Text("\(detail.genres)")
                .multilineTextAlignment(.leading)
                .foregroundColor(.gray)
                .font(.caption)
                .fontWeight(.regular)
            
            Text("\(detail.schedule)")
                .multilineTextAlignment(.leading)
                .foregroundColor(.gray)
                .font(.caption)
                .fontWeight(.regular)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 210)
        .padding(.horizontal, 16)
        .background(Color.black)
    }
}

#Preview {
   ShowInfoView(detail: ShowDetailMapper.map(show: MockedDetailData.detail))
}
