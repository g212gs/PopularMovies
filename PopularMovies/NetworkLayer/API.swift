//
//  API.swift
//  PopularMovies
//
//  Created by Gaurang Lathiya on 27/08/22.
//

import Foundation

enum API {
    case popularMovies(page: Int)
    case movieDetails(movie_id: Int)
    
    var jsonFileName: String {
        switch self {
        case .popularMovies( _):
            return "LocalPopularMovies"
        case .movieDetails( _):
            return "LocalMovieDetail"
        }
    }
    
    func urlRequest() throws -> URLRequest {
        switch self {
        case .popularMovies(let page):
            do {
                let path = "\(NetworkManager.MovieBaseUrl)popular?api_key=\(NetworkManager.API_KEY)&language=en-US&page=\(page)"
                guard let apiUrl = URL(string: path) else {
                    throw APIError.invalidUrl
                }
                var requestUrl = URLRequest(url: apiUrl)
                requestUrl.httpMethod = "GET"
                return requestUrl
            }
        case .movieDetails(let movie_id):
            do {
                let path = "\(NetworkManager.MovieBaseUrl)\(movie_id)?api_key=\(NetworkManager.API_KEY)&language=en-US"
                guard let apiUrl = URL(string: path) else {
                    throw APIError.invalidUrl
                }
                var requestUrl = URLRequest(url: apiUrl)
                requestUrl.httpMethod = "GET"
                return requestUrl
            }
        }
    }
}
