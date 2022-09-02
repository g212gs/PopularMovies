//
//  MovieList.swift
//  PopularMovies
//
//  Created by Gaurang Lathiya on 27/08/22.
//

import Foundation

// MARK: - MovieList
struct MovieList: Codable {
    var page: Int?
    var results: [Movie]?
    var totalResults, totalPages: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

// MARK: - Result
struct Movie: Codable, Identifiable {
    var posterPath: String?
    var adult: Bool?
    var overview, releaseDate: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalTitle: String?
    var originalLanguage: String?
    var title, backdropPath: String?
    var popularity: Double?
    var voteCount: Int?
    var video: Bool?
    var voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case adult, overview
        case releaseDate = "release_date"
        case genreIDS = "genre_ids"
        case id
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case title
        case backdropPath = "backdrop_path"
        case popularity
        case voteCount = "vote_count"
        case video
        case voteAverage = "vote_average"
    }
}
