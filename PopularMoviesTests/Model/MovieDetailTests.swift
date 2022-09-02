//
//  MovieDetailTests.swift
//  PopularMoviesTests
//
//  Created by Gaurang Lathiya on 31/08/22.
//

import XCTest
@testable import PopularMovies

class MovieDetailTests: XCTestCase {
    
    func testMovieDetailModelOne() {
        let sampleJson = """
        {
          "adult": false,
          "backdrop_path": "/fCayJrkfRaCRCTh8GqN30f8oyQF.jpg",
          "budget": 63000000,
          "genres": [
            {
              "id": 18,
              "name": "Drama"
            }
          ],
          "homepage": "",
          "id": 550,
          "imdb_id": "tt0137523",
          "original_language": "en",
          "original_title": "Fight Club",
          "overview": "A ticking-time-bomb insomniac and a slippery",
          "popularity": 0.5,
          "poster_path": " ",
          "production_companies": [
            {
              "id": 508,
              "logo_path": "/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png",
              "name": "Regency Enterprises",
              "origin_country": "US"
            }
          ],
          "production_countries": [
            {
              "iso_3166_1": "US",
              "name": "United States of America"
            }
          ],
          "release_date": "1999-10-12",
          "revenue": 100853753,
          "runtime": 139,
          "spoken_languages": [
            {
              "iso_639_1": "en",
              "name": "English"
            }
          ],
          "status": "Released",
          "tagline": "How much can you know about yourself if you've never been in a fight?",
          "title": "Fight Club",
          "video": false,
          "vote_average": 7.8,
          "vote_count": 3439
        }
        """
        
        let jsonData = sampleJson.data(using: .utf8) ?? Data()
        do {
            let movieDetail = try JSONDecoder().decode(MovieDetail.self, from: jsonData)
            XCTAssertNotNil(movieDetail)
        } catch {
            XCTAssert(false, error.localizedDescription)
        }
    }
    
    func testMovieDetailModelTwo() {
        let sampleJson = """
        {
          "adult": false,
          "backdrop_path": "/fCayJrkfRaCRCTh8GqN30f8oyQF.jpg",
          "budget": 63000000,
          "genres": [
            {
              "id": 18,
              "name": "Drama"
            }
          ],
          "homepage": "",
          "id": 550,
          "imdb_id": "tt0137523",
          "original_language": "en",
          "original_title": "Fight Club",
          "overview": "A ticking-time-bomb insomniac and a slippery soap salesman",
          "popularity": 0.5,
          "poster_path": null,
          "production_companies": [
            {
              "id": 508,
              "logo_path": "/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png",
              "name": "Regency Enterprises",
              "origin_country": "US"
            }
          ],
          "production_countries": [
            {
              "iso_3166_1": "US",
              "name": "United States of America"
            }
          ],
          "release_date": "1999-10-12",
          "revenue": 100853753,
          "runtime": 139,
          "spoken_languages": [
            {
              "iso_639_1": "en",
              "name": "English"
            }
          ],
          "status": "Released",
          "tagline": "How much can you know about yourself if you've never been in a fight?",
          "title": "Fight Club",
          "video": false,
          "vote_average": "7.8",
          "vote_count": "3439"
        }
        """
        
        let jsonData = sampleJson.data(using: .utf8) ?? Data()
        do {
            let movieDetail = try JSONDecoder().decode(MovieDetail.self, from: jsonData)
            XCTAssertNotNil(movieDetail)
        } catch {
            XCTAssert(false, error.localizedDescription)
        }
    }

}
