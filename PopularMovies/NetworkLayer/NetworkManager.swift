//
//  NetworkManager.swift
//  PopularMovies
//
//  Created by Gaurang Lathiya on 27/08/22.
//

import Foundation
import Combine
import Alamofire

enum APIError: Error {
  case invalidUrl
  case unknown
  case decoding(error: Error?)
  case request(statusCode: Int, error: Error?)
}

protocol NetworkManagerProtocol {
    func fetchData<T: Decodable>(with api: API) -> AnyPublisher<DataResponse<T, APIError>, Never>
}

struct NetworkManager: NetworkManagerProtocol {
    
    static let APIBaseUrl = "https://api.themoviedb.org/3/"
    static var MovieBaseUrl = (NetworkManager.APIBaseUrl + "movie/")
    static let API_KEY = "f2442d6ae8485e31aa8596c83a42dfe7"
    static let ImageBaseUrl = "https://image.tmdb.org/t/p/original/"
    
    func fetchData<T>(with api: API) -> AnyPublisher<DataResponse<T, APIError>, Never> where T : Decodable {
        do {
            let urlRequest = try api.urlRequest()
            return AF.request(urlRequest)
                .validate()
                .publishDecodable(type: T.self)
                .map { response in
                    response.mapError { error in
                        return APIError.request(statusCode: response.response?.statusCode ?? 0, error: error)
                    }
                }
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        } catch let apiError as APIError {
            return Just(DataResponse(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: .zero, result: .failure(apiError))).eraseToAnyPublisher()
        } catch  {
            return Just(DataResponse(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: .zero, result: .failure(APIError.unknown))).eraseToAnyPublisher()
        }
    }
}
