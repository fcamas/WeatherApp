//
//  SearchWeatherCoordinator.swift
//  WeatherApp
//
//  Created by Fredy Camas on 9/17/24.
//

import UIKit

class ImageCache {
    static let shared = NSCache<NSString, UIImage>()
    
    func cacheImage(for urlString: String, image: UIImage) {
        ImageCache.shared.setObject(image, forKey: urlString as NSString)
    }

    func getCachedImage(for urlString: String) -> UIImage? {
        return ImageCache.shared.object(forKey: urlString as NSString)
    }
}
