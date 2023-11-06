//
//  SongListView.swift
//  ItunesSearchApp
//
//  Created by Boris Romão Antunes on 20/10/23.
//

import SwiftUI

struct SongListView: View {
    var body: some View {
        
        @ObservedObject var viewModel: SongsListViewModel
        
        var body: some View {
            
            List {
                ForEach(viewModel.songs) { song in
                    Text(song.collectionName)
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
}

#Preview {
    SongListView()
}
