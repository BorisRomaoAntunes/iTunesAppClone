//
//  APIServerse.swift
//  ItunesSearchApp
//
//  Created by Boris Romão Antunes on 28/09/23.
//

import Foundation

enum EntityType: String{
    case album
    case song
    case movie
}

class APIServise {
    func fetchAlbum(searchTerm: String, page: Int, limit: Int, completion: @escaping(Result<AlbumResult, APIError>)->Void){
        let url = cratURL(for: searchTerm, type: .album, page: page, limit: limit)
        fetch(type: AlbumResult.self, url: url, completion: completion)
    }
    
    func fetchSong(searchTerm: String, page: Int, limit: Int, completion: @escaping(Result<SongResult, APIError>)->Void){
        let url = cratURL(for: searchTerm, type: .song , page: page, limit: limit)
        fetch(type: SongResult.self, url: url, completion: completion)
    }
    
    func fetchMovies(searchTerm: String,completion: @escaping(Result<MovieResult, APIError>)->Void){
        let url = cratURL(for: searchTerm, type: .movie , page: nil, limit: nil)
        fetch(type: MovieResult.self, url: url, completion: completion)
    }

    
    func fetch<T: Decodable>(type: T.Type, url: URL?, completion: @escaping(Result<T , APIError>)->Void){
        
        guard let url = url else {
            let error = APIError.babURL
            completion(Result.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            
            if let error = error as? URLError{
                completion(Result.failure(APIError.urlSession(error)))
            }else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    completion(Result.failure(APIError.babResponse(response.statusCode)))
            } else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(Result.success(result))
                   
                } catch {
                    completion(Result.failure(.decoding(error as? DecodingError)))
                }
            }
        }.resume()
    }
    func cratURL(for searchTerm: String, type: EntityType, page: Int?, limit: Int?)-> URL? {
        // https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5&offset=10
        let baseURL = "https://itunes.apple.com/search"
        
//
        var queryItems = [URLQueryItem(name: "term", value: searchTerm),
                          URLQueryItem(name: "entity", value: type.rawValue)]
        
        if let page = page, let limit = limit {
            let offset = page * limit
            queryItems.append(URLQueryItem(name: "limit", value: String(limit)))
            queryItems.append(URLQueryItem(name: "offset", value: String(offset)))
            

        }
        
        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems
        return components?.url
    }
}

