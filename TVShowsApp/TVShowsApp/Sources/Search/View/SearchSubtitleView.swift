//
//  SearchSubtitleView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 14/05/2025.
//

import SwiftUI

struct SearchSubtitleView: View {
    let text: String
    var body: some View {
        HStack(spacing: 0) {
            Text(text)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .font(.headline)
                .fontWeight(.bold)
                .padding(.horizontal, 12)
            Spacer()
        }
        .background(.black)
        .frame(maxWidth: .infinity)
        .frame(maxHeight: 40)
    }
}

#Preview {
    SearchSubtitleView(text: "Recommended TV Shows")
}
