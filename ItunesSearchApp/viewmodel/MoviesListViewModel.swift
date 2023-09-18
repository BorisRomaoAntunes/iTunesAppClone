//
//  MoviesListViewModel.swift
//  ItunesSearchApp
//
//  Created by Boris Romão Antunes on 28/09/23.
//

import Foundation
import Combine

class MoviesListViewModel: ObservableObject{
    
    @Published var searchTerm: String = ""
    @Published var movies: [Movie] = [Movie]()
    @Published var state: FetchState = .good
    
    private let service = APIServise()
    
    var subscriptions = Set<AnyCancellable>()
   
    
    init() {

            $searchTerm
                .dropFirst()
                .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
                .sink { [weak self] term in
                    self?.state = .good
                    self?.movies = []
                    self?.fetchMovies(for: term)
                }.store(in: &subscriptions)
            
        }
    
    func fetchMovies(for searchTerm: String) {
        
        guard !searchTerm.isEmpty else { return }
    
        guard state == FetchState.good else { return }
            
        state = .isLoading
        
        service.fetchMovies(searchTerm: searchTerm) {[weak self] result in
            
            DispatchQueue.main.async {
            switch result{
                case .success(let results):
                    self?.movies = results.results
                    
                if results.resultCount == 0{ // tenho duvidas sobre isso aqui
                        self?.state = .good
                    } else {
                        self?.state = .loadedAll
                    }
                
                print("fetched \(results.resultCount)")
                    
                case .failure(let error):
                    print(" 🫥 Could not load: \(error)")
                    self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
    func loadMore() {
        fetchMovies(for: searchTerm)
    }
}
