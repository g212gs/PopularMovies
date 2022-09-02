//
//  MovieListTests.swift
//  PopularMoviesTests
//
//  Created by Gaurang Lathiya on 31/08/22.
//

import XCTest
@testable import PopularMovies

class MovieListTests: XCTestCase {
    
    func testMovieModelOne() {
        let sampleJson = """
            {
              "poster_path": "/rugyJdeoJm7cSJL1q4jBpTNbxyU.jpg",
              "adult": false,
              "overview": "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
              "release_date": "2016-08-03",
              "genre_ids": [
                14,
                28,
                80
              ],
              "id": 297761,
              "original_title": "Suicide Squad",
              "original_language": "en",
              "title": "Suicide Squad",
              "backdrop_path": "/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jpg",
              "popularity": 48.261451,
              "vote_count": 1466,
              "video": false,
              "vote_average": 5.91
            }
        """
        
        let jsonData = sampleJson.data(using: .utf8) ?? Data()
        do {
            let movie = try JSONDecoder().decode(Movie.self, from: jsonData)
            XCTAssertNotNil(movie)
        } catch {
            XCTAssert(false, error.localizedDescription)
        }
    }
    
    func testMovieModelTwo() {
        let sampleJson = """
            {
              "poster_path": "/rugyJdeoJm7cSJL1q4jBpTNbxyU.jpg",
              "adult": false,
              "overview": "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
              "release_date": "2016-08-03",
              "genre_ids": [
                14,
                28,
                80
              ],
              "id": "297761",
              "original_title": "Suicide Squad",
              "original_language": "en",
              "title": "Suicide Squad",
              "backdrop_path": "/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jpg",
              "popularity": 48.261451,
              "vote_count": 1466,
              "video": false,
              "vote_average": 5.91
            }
        """
        
        let jsonData = sampleJson.data(using: .utf8) ?? Data()
        do {
            let movie = try JSONDecoder().decode(Movie.self, from: jsonData)
            XCTAssertNotNil(movie)
        } catch {
            XCTAssert(false, error.localizedDescription)
        }
    }

}
