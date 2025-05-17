//
//  ShowsHeaderTitleView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 16/05/2025.
//

import SwiftUI

struct ShowsHeaderTitleView: View {
    let viewData: ShowsViewData
    var body: some View {
        HStack {
            ShowsTitleView(title: viewData.title)
            Spacer()
            NavigationLink(destination: SearchView.build(for: viewData.shows)) {
                SearchImageView()
            }
        }
    }
}

private struct SearchImageView: View {
    var body: some View {
        Image(systemName: "magnifyingglass")
            .font(.system(size: 28, weight: .light))
            .foregroundColor(.white)
            .frame(width: 32, height: 32)
            .padding(8)
    }
}

private struct ShowsTitleView: View {
    let title: String
    var body: some View {
        Text(title)
            .multilineTextAlignment(.leading)
            .foregroundColor(.white)
            .font(.title)
            .fontWeight(.bold)
            .padding(.horizontal, 8)
    }
}

#Preview {
    ShowsHeaderTitleView(viewData: ShowsViewData(shows: ShowMapper.map(shows: MockedData.shows), title: "For You", recommendedShow: ShowMapper.map(show: MockedData.shows[0])))
}
