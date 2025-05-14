//
//  AsyncRemoteImage.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 13/05/2025.
//

import SwiftUI


struct AsyncRemoteImage: View {
    @StateObject var imageLoader: ImageLoader
    
    init(url: URL?, cache: ImageCache? = ImageCache.shared) {
        _imageLoader = StateObject(wrappedValue: ImageLoader(url: url, cache: cache))
    }
    
    var body: some View {
        innerView
            .task {
                await imageLoader.load()
            }
    }
    
    @ViewBuilder
    private var innerView: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
        } else {
            //TODO: - add generic placeholder
            Image(systemName: "photo")
                .resizable()
                .scaledToFill()
                .foregroundColor(.white)
                .background(Color(white: 0.1))
                .opacity(0.2)
        }
    }
}

#Preview {
    let url = URL(string: MockedData.shows[0].image?.medium ?? "")
    AsyncImage(url: url)
}
