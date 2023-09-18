//
//  MovieListView.swift
//  ItunesSearchApp
//
//  Created by Boris Romão Antunes on 29/09/23.
//

import SwiftUI

struct MovieSearchListView: View {
    @StateObject private var viewModel = MoviesListViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.searchTerm.isEmpty {
                    AlbumPlaceholderView(searchTerm: $viewModel.searchTerm)
                } else {
                MovieListView(viewModel: viewModel)
                }
            }
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("🍿 Search Movies")
        }
    }
}

#Preview {
    MovieSearchListView()
}
