//
//  ShowsHeaderContainerView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 15/05/2025.
//

import SwiftUI

struct ShowsHeaderContainerView: View {
    let viewData: ShowsViewData
   
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            ShowsHeaderTitleView(viewData: viewData)
            Spacer()
            RecommendedShowView(show: viewData.recommendedShow)
            Spacer()
        }
    }
}

#Preview {
    ShowsHeaderContainerView(viewData: ShowsViewData(shows: ShowMapper.map(shows: MockedData.shows), title: "For You", recommendedShow: ShowMapper.map(show: MockedData.shows[0])))
}
