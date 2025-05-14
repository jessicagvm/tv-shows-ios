//
//  ShowInfoView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 11/05/2025.
//

import SwiftUI

struct ShowInfoView: View {
    let detail: ShowDetail
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            //FIXME: - text formatter for all
            Text("\(detail.summary ?? "")")
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .font(.footnote)
                .fontWeight(.regular)
            
            Text("\(detail.genres[0])")
                .multilineTextAlignment(.leading)
                .foregroundColor(.gray)
                .font(.caption)
                .fontWeight(.regular)
            
            Text("\(detail.schedule.days[0])")
                .multilineTextAlignment(.leading)
                .foregroundColor(.gray)
                .font(.caption)
                .fontWeight(.regular)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .padding(.horizontal, 16)
        .background(Color.black)
        .shadow(color: .black.opacity(0.6), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    ShowInfoView(detail: MockedDetailData.detail)
}
