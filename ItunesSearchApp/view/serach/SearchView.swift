//
//  SearchView.swift
//  ItunesSearchApp
//
//  Created by Boris Romão Antunes on 20/10/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchTerm = ""
    @State private var selectedEntityType = EntityTiper.all
    
    var body: some View {
        NavigationView{
            VStack{
                Picker("Select the media", selection: $selectedEntityType) {
                    ForEach(EntityTiper.allCases){ type in
                        Text(type.name())
                            .tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                Divider()
                Spacer()
                
            }
            .searchable(text: $searchTerm)
            .navigationTitle("Pesquisa")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
