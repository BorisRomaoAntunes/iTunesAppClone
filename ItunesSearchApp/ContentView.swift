//
//  ContentView.swift
//  ItunesSearchApp
//
//  Created by Karin Prater on 25.07.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            AlbumSearchView()
                .tabItem {
                    Label("Album", systemImage: "music.note.house")
                }
            MovieSearchListView()
                .tabItem {
                    Label("Movie", systemImage: "popcorn")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
