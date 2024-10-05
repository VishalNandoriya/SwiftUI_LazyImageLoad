//
//  NetworkImageView.swift
//  SwiftUI_LazyImageLoad
//
//  Created by Vishal Nandoriya on 05/10/24.
//

import SwiftUI
import Foundation

struct NetworkImageView: View {
    @ObservedObject var downLoader: ImageDownloader
    var placeholder: Image
    var width: CGFloat
    var height: CGFloat
    
    init(url: String, placeholder: Image = Image(systemName: "photo"), width: CGFloat = 100, height: CGFloat = 100) {
        downLoader = ImageDownloader(url: url)
        self.placeholder = placeholder
        self.width = width
        self.height = height
    }
    
    var body: some View {
        image
            .frame(width: width, height: height)
            .clipped()
    }
    
    private var image: some View {
        Group {
            if let uiImage = downLoader.image {
                Image(uiImage: uiImage)
                    .resizable()
            } else {
                placeholder
                    .resizable()
            }
        }
    }
}
