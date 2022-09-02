//
//  MovieListScreen.swift
//  PopularMovies
//
//  Created by Gaurang Lathiya on 19/08/22.
//

import SwiftUI

struct MovieListScreen: View {
    @StateObject var viewModel = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    if let movies = viewModel.movieList, movies.count > 0 {
                        List (movies) { movie in
                            NavigationLink(destination: MovieDetailView(movie: movie)){
                                MoviesListTileView(imageName: movie.posterPath ?? "")
                                    .listRowInsets(EdgeInsets())
                            }
                        }
                    } else {
                        VStack(alignment: .center, spacing: 10.0) {
                            Image(systemName: Constants.PlaceHolderMoviePosterSystemImg)
                                .resizable()
                                .frame(width: 200.0, height: 200.0)
                                .foregroundColor(.gray)
                            Text(Constants.NoMoviesAvailable)
                        }
                    }
                }
                
            }
            .onAppear {
                if ((viewModel.movieList == nil) || (viewModel.movieList?.count == 0)) {
                    viewModel.getPopularMovies()
                }
            }
            .navigationBarTitle(Text(Constants.TitlePopularMovieList))
        }
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
