//
//  NetworkImageViewModel.swift
//  SwiftUI_LazyImageLoad
//
//  Created by Vishal Nandoriya on 05/10/24.
//

import Foundation

class NetworkImageViewModel: ObservableObject {
    @Published var images: [ImageInfo] = []
    
    init() {
        loadImages()
    }
    
    private func loadImages() {
        for i in 1...100 {
            let url = "https://via.placeholder.com/800/\(String(format: "%06X", Int.random(in: 0...0xFFFFFF)))"
            let description = "Picture \(i)"
            let imageData = ImageInfo(url: url, description: description)
            images.append(imageData)
        }
    }
}
