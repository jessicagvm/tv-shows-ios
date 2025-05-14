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
        VStack(alignment: .leading, spacing: 10) {
            Spacer()
            //FIXME: - text formatter for all
            Text("\(detail.summary?.strippedHTML ?? "")")
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .font(.footnote)
                .fontWeight(.regular)
            
            Text("Genres: \(detail.genres[0])")
                .multilineTextAlignment(.leading)
                .foregroundColor(.gray)
                .font(.caption)
                .fontWeight(.regular)
            
            Text("Schedule: \(detail.schedule.days[0]) at \(detail.schedule.time)")
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
    ShowInfoView(detail: MockedDetailData.detail)
}
