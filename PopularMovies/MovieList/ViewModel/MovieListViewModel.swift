//
//  MovieListViewModel.swift
//  PopularMovies
//
//  Created by Gaurang Lathiya on 28/08/22.
//

import Foundation
import Combine

class MovieListViewModel: ObservableObject, PopularMoviesService {
    var service: NetworkManagerProtocol
    var cancellables = Set<AnyCancellable>()
    @Published var movieList: [Movie]?
    
    var currentPage: Int = 1
    var totalPage: Int = 1
    var isInternetAvailable: Bool = true
    @Published var isLoading: Bool = true
    
    init() {
        if isInternetAvailable {
            self.service = NetworkManager()
        } else {
            self.service = LocalDataManager()
        }
        
    }

    func getPopularMovies() {
        self.isLoading = true
        let cancellableBankDetails = self.getPopularMovies(page: currentPage)
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
                    if let list = response.value?.results, list.count > 0 {
                        self?.movieList = list
                    }
                    if let totalPages = response.value?.totalPages {
                        self?.totalPage = totalPages
                    }
                    if let page = response.value?.page {
                        self?.currentPage = page
                    }
                }
            })
        cancellables.insert(cancellableBankDetails)
    }
}

