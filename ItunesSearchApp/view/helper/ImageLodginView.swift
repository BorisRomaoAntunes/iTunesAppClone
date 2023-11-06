//
//  ImageLoadingView.swift
//  ItunesSearchApp
//
//  Created by Boris Romão Antunes on 02/11/23.
//

import SwiftUI

struct ImageLodginView: View {
    
    let urlString: String
    let size: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)){ image in
            image
                .resizable()
                .border(Color(white: 0.8))
            
        } placeholder: {
            ProgressView()
        }
        .frame(width: size, height: size)
    }
}


#Preview {
    ImageLodginView()
}
