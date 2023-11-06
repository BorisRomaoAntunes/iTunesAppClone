//
//  SearchAlbumPlaceholderView.swift
//  ItunesSearchApp
//
//  Created by Boris Romão Antunes on 24/10/23.
//

import SwiftUI

struct SearchAlbumPlaceholderView: View {
    @Binding var searchTerm: String
    
    let suggestions = ["rammstein", "cry to me", "Harry Potter"]
    
    var body: some View {

                VStack(spacing: 20) {
                    
                    Text("Trending")
                        .font(.title)
                    ForEach(suggestions, id: \.self) { text in
                        Button {
                            searchTerm = text
                        } label: {
                            Text(text)
                                .font(.title2)
                        }

                    }
                    
                }
            }
        }

#Preview {
    SearchAlbumPlaceholderView(searchTerm: .constant("Harry Potter"))
}
