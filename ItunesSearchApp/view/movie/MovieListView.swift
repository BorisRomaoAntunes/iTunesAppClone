//
//  MovieListView.swift
//  ItunesSearchApp
//
//  Created by Boris Romão Antunes on 29/09/23.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var viewModel: MoviesListViewModel
    
    var body: some View {
        
        List {
            ForEach(viewModel.movies) { movie in
                Text(movie.trackName)
            }
            
            switch viewModel.state {
                case .good:
                    Color.clear
                        .onAppear {
                            viewModel.loadMore()
                        }
                case .isLoading:
                    ProgressView()
                        .progressViewStyle(.circular)
                        .frame(maxWidth: .infinity)
                case .loadedAll:
                    EmptyView()
                case .error(let message):
                    Text(message)
                        .foregroundColor(.pink)
            }
        }
        .listStyle(.plain)
        
    }

}

#Preview {
    MovieListView(viewModel: MoviesListViewModel())
}
