//
//  LocalDataManager.swift
//  PopularMovies
//
//  Created by Gaurang Lathiya on 31/08/22.
//

import Foundation
import Combine
import Alamofire

struct LocalDataManager: NetworkManagerProtocol {
    func fetchData<T>(with api: API) -> AnyPublisher<DataResponse<T, APIError>, Never> where T : Decodable {
        
        if let path = Bundle.main.url(forResource: api.jsonFileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: path)
                let model = try JSONDecoder().decode(T.self, from: data)
                return Just(DataResponse(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: .zero, result: .success(model))).eraseToAnyPublisher()
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        return Just(DataResponse(request: nil, response: nil, data: nil, metrics: nil, serializationDuration: .zero, result: .failure(APIError.unknown))).eraseToAnyPublisher()
    }
}
