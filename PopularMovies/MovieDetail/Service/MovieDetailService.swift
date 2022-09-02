//
//  MovieDetailService.swift
//  PopularMovies
//
//  Created by Gaurang Lathiya on 31/08/22.
//

import Foundation
import Combine
import Alamofire

protocol MovieDetailService {
    var service: NetworkManagerProtocol {get}
    
    // Get movie detail
    func getMovieDetail(movieId: Int) -> AnyPublisher<DataResponse<MovieDetail, APIError>, Never>
}

extension MovieDetailService {
    func getMovieDetail(movieId: Int) -> AnyPublisher<DataResponse<MovieDetail, APIError>, Never> {
        return service.fetchData(with: API.movieDetails(movie_id: movieId))
            .eraseToAnyPublisher()
    }
}
