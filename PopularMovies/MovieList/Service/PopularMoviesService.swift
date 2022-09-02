//
//  MovieListService.swift
//  PopularMovies
//
//  Created by Gaurang Lathiya on 27/08/22.
//

import Foundation
import Combine
import Alamofire

protocol PopularMoviesService {
    var service: NetworkManagerProtocol {get}
    
    // Get popular movie list
    func getPopularMovies(page: Int) -> AnyPublisher<DataResponse<MovieList, APIError>, Never>
}

extension PopularMoviesService {
    func getPopularMovies(page: Int) -> AnyPublisher<DataResponse<MovieList, APIError>, Never> {
        return service.fetchData(with: API.popularMovies(page: page))
            .eraseToAnyPublisher()
    }
}
