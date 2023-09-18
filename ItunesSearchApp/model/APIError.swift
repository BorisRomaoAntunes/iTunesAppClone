//
//  APIError.swift
//  ItunesSearchApp
//
//  Created by Boris Romão Antunes on 28/09/23.
//

import Foundation

enum APIError: Error, CustomStringConvertible{
    
    case babURL
    case urlSession (URLError?)
    case babResponse(Int)
    case decoding (DecodingError?)
    case unknown
    
    var description: String{
        switch self {
        case .babURL:
            return "😵‍💫 babURl"
        case .urlSession(let error):
            return "😵‍💫 urlSession erro \(error.debugDescription)"
        case .babResponse(let statusCode):
            return "😵‍💫 bab response: \(statusCode)"
        case .decoding(let decodingError):
            return "😵‍💫 deconding erro: \(String(describing: decodingError))"
        case .unknown:
            return "😵‍💫 unknown error"
        }
    }
    
    var localizeDescription: String {
        switch self {
        case .babURL,.unknown:
            return "😵‍💫 sonething wen wrong"
        case .urlSession(let urlError):
            return urlError?.localizedDescription ?? "😵‍💫 sonething wen wrong"
        case .babResponse(_):
            return "😵‍💫 sonething wen wrong"
        case .decoding(let decodingError):
            return decodingError?.localizedDescription  ?? "😵‍💫 sonething wen wrong"
        }
    }
}


