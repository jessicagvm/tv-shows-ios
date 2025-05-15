//
//  SearchBarView.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 12/05/2025.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    let placeholder: String
  
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.horizontal, 8)
                .padding(.vertical, 8)
            
            TextField(placeholder, text: $text)
                .foregroundColor(.white)
                .placeholder(when: text.isEmpty) {
                    Text(placeholder)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 8)
                .background(Color.black.opacity(0.1))
                .cornerRadius(8)
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
        .padding([.horizontal, .top], 6)
    }
}

#Preview {
    // TODO: - support preview
}
