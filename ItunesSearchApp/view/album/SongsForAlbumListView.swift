//
//  SongsFerAlbumListView.swift
//  ItunesSearchApp
//
//  Created by Boris Romão Antunes on 03/11/23.
//

import SwiftUI

struct SongsForAlbumListView: View {
    
    @ObservedObject var songsViewMode : SongsForAlbumListViewModel
    
    
    var body: some View {
        VStack{
            ForEach(songsViewMode.songs){ song in
                Text("\(song.trackNumber)")
            }
        }
    }
}

#Preview {
    SongsForAlbumListView(songsViewMode: SongsForAlbumListViewModel.example())
}
