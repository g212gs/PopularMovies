//
//  MovieDetailViewModel.swift
//  PopularMovies
//
//  Created by Gaurang Lathiya on 31/08/22.
//

import Foundation
import Combine

class MovieDetailViewModel: ObservableObject, MovieDetailService {
    var service: NetworkManagerProtocol
    
    var cancellables = Set<AnyCancellable>()
    @Published var movieDetail: MovieDetail?
    
    var isInternetAvailable: Bool = true
    @Published var isLoading: Bool = true
    
    init() {
        if isInternetAvailable {
            self.service = NetworkManager()
        } else {
            self.service = LocalDataManager()
        }
    }
    
    
    func getMovieDetail(ofMovieId movieId: Int) {
        self.isLoading = true
        let cancellableBankDetails = self.getMovieDetail(movieId: movieId)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] response in
                self?.isLoading = false
                if let error = response.error {
                    print("API Error: \(error.localizedDescription)")
                } else {
                    if let movieDetailWS = response.value {
                        self?.movieDetail = movieDetailWS
                    }
                }
            })
        cancellables.insert(cancellableBankDetails)
    }
    
}
