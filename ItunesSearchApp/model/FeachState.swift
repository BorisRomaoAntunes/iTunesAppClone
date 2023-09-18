//
//  FeachState.swift
//  ItunesSearchApp
//
//  Created by Boris Romão Antunes on 28/09/23.
//

import Foundation


enum FetchState: Comparable {
    case good
    case isLoading
    case loadedAll
    case error(String)
}


