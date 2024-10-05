//
//  ContentView.swift
//  SwiftUI_LazyImageLoad
//
//  Created by Vishal Nandoriya on 05/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NetworkImageViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.images) { imageData in
                HStack {
                    NetworkImageView(url: imageData.url,width: 200, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text(imageData.description)
                        .font(.headline)
                }
                .padding(.vertical, 8)
            }
            .navigationTitle("Lazy Loading Images")
        }
    }
}

#Preview {
    ContentView()
}
