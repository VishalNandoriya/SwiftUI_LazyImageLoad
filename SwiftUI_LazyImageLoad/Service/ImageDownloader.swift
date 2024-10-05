//
//  ImageDownloader.swift
//  SwiftUI_LazyImageLoad
//
//  Created by Vishal Nandoriya on 05/10/24.
//

import SwiftUI
import Combine

class ImageDownloader: ObservableObject {
    @Published var image: UIImage?
    private let url: String
    private var cancellable: AnyCancellable?
    private static let cache = NSCache<NSString, UIImage>()
    
    init(url: String) {
        self.url = url
        loadImage()
    }
    
    private func loadImage() {
        if let cachedImage = Self.cache.object(forKey: url as NSString) {
            self.image = cachedImage
            return
        }
        
        guard let imageUrl = URL(string: url) else { return }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: imageUrl)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] image in
                if let image = image {
                    Self.cache.setObject(image, forKey: self?.url as NSString? ?? "")
                }
                self?.image = image
            }
    }
    
    deinit {
        cancellable?.cancel()
    }
}
