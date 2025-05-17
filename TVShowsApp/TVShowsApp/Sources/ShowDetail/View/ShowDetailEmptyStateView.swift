//
//  ShowDetailEmptyStateView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 16/05/2025.
//

import SwiftUI

struct ShowDetailEmptyStateView: View {
    let header: ShowDetailViewData
    let title: String
    let message: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ShowContainerView(detail: header)
            EmptyStateView(title: title, message: message)
            Spacer()
        }
    }
}

#Preview {
    ShowDetailEmptyStateView(header: ShowDetailMapper.map(show: MockedDetailData.detail),
                             title: "No episodes available",
                             message: nil)
}
