//
//  ShowContainerView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 13/05/2025.
//

import SwiftUI

struct ShowContainerView: View {
    let detail: ShowDetail
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ShowHeaderView(detail: detail)
            ShowInfoView(detail: detail)
        }
    }
}

#Preview {
    ShowContainerView(detail: MockedDetailData.detail)
}
