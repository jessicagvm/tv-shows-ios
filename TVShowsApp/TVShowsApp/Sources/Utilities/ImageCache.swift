//
//  ImageCache.swift
//  TVShowsApp
//
//  Created by Jessica Vasquez on 13/05/2025.
//

import Foundation
import UIKit

protocol ImageCacheProtocol {
    subscript(_ cachedImageKey: URL) -> UIImage? { get set }
}

final class ImageCache: ImageCacheProtocol {
    private let cache = NSCache<NSURL, UIImage>()
    static let shared = ImageCache()
    
    private init() {}
    
    subscript(_ cachedImageKey: URL) -> UIImage? {
        get { cache.object(forKey: cachedImageKey as NSURL)
        }
        set {
            if let image = newValue {
                cache.setObject(image, forKey: cachedImageKey as NSURL)
            } else {
                cache.removeObject(forKey: cachedImageKey as NSURL)
            }
        }
    }
}
