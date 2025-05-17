//
//  ShowTitleView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 16/05/2025.
//
import SwiftUI

struct ShowTitleView: View {
    let name: String
    var body: some View {
        Text(name)
            .multilineTextAlignment(.leading)
            .foregroundColor(.white)
            .font(.headline)
            .fontWeight(.medium)
            .padding(.horizontal, 8)
    }
}
