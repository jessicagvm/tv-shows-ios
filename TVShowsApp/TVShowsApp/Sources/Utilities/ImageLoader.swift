//
//  ImageLoader.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 13/05/2025.
//

import Foundation
import UIKit


@MainActor
final class ImageLoader: ObservableObject {
    private let url: URL?
    private var cache: ImageCacheProtocol?
    private let client: NetworkClientProtocol
    
    @Published var image: UIImage?
    
    //TODO: - add ImageLoaderServiceProtocol
    init(url: URL?, cache: ImageCacheProtocol? = nil, client: NetworkClientProtocol = NetworkClient(session: URLSession.shared)) {
        self.client = client
        self.url = url
        self.cache = cache
    }
    
    func load() async {
        guard let url = url else { return } 
        if let savedImage = cache?[url] {
            self.image = savedImage
            return
        }
        
        do {
            let data = try await client.download(from: url)
            
            guard let image = UIImage(data: data) else { return }
            self.image = image
            cache?[url] = image
        } catch {
            print("Image load error: \(error.localizedDescription)")
        }
    }
}
